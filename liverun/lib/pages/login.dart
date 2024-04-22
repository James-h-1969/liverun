library loginLib;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logIn(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userNameController.text,
        password: passWordController.text,
      );
      // Navigate to main page on successful login
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      // Handle login error
      print("Failed to log in: $e");
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to log in. Please check your credentials."),
        ),
      );
    }
  }

  Future<void> signUp(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userNameController.text,
        password: passWordController.text,
      );
      // Navigate to main page on successful sign-up
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      // Handle sign-up error
      print("Failed to sign up: $e");
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign up. Please try again."),
        ),
      );
    }
  }

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
                onPressed: () => logIn(context),
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
                onPressed: () => signUp(context),
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}