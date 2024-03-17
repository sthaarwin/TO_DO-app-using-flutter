// ignore_for_file: unused_field, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //--------------------------------------------------------
  final _formkey = GlobalKey<FormState>();
  String? _email = '';
  // ignore: prefer_final_fields
  String? _password = '';
  String? _username = '';
  bool isLoginPage = false;
  //--------------------------------------------------------

  startauthentication() async {
    final validity = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (validity ?? true) {
      _formkey.currentState?.save();
      submitform(_email!, _password!, _username!);
    }
  }

  submitform(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) {
        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String? uid = authResult.user?.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({'username': username, 'email': email});
      }
    } catch (err) {
      // ignore: avoid_print
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            height: 200,
            child: Image.asset('assets/todo.png'),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isLoginPage)
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Incorrect username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                // ignore: unnecessary_new
                                borderRadius: new BorderRadius.circular(8.0),
                                // ignore: unnecessary_new,
                                borderSide: new BorderSide()),
                            labelText: "Enter username",
                            labelStyle: GoogleFonts.roboto()),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: const ValueKey('email'),
                      validator: (value) {
                        // ignore: dead_code
                        if (value?.isEmpty ?? true || value!.contains('(@')) {
                          return 'Incorrect Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                      decoration: InputDecoration(
                          // ignore: duplicate_ignore, duplicate_ignore
                          border: OutlineInputBorder(
                              // ignore: unnecessary_new
                              borderRadius: new BorderRadius.circular(8.0),
                              // ignore: unnecessary_new, prefer_const_constructors
                              borderSide: new BorderSide()),
                          labelText: "Enter email",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Incorrect password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // ignore: unnecessary_new
                              borderRadius: new BorderRadius.circular(8.0),
                              // ignore: unnecessary_new,
                              borderSide: new BorderSide()),
                          labelText: "Enter password",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: isLoginPage
                            ? Text(
                                'Login',
                                style: GoogleFonts.roboto(fontSize: 16),
                              )
                            : Text(
                                'SignUp',
                                style: GoogleFonts.roboto(fontSize: 16),
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          startauthentication();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              isLoginPage = !isLoginPage;
                            });
                          },
                          child: isLoginPage
                              ? Text(
                                  "Not a member?",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              : Text("Already a member?",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
