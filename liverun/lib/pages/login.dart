library loginLib;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../functions/auth.dart';

class MyLogin extends StatelessWidget {
  final authService auth;

  MyLogin({super.key, required this.auth});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Log in",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passWordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true, // Hide password text
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => auth.logIn(context, userNameController.text, passWordController.text),
                child: Text("Log in"),
              ),
              Text(
                "No account?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () => auth.signUp(context, userNameController.text, passWordController.text),
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}