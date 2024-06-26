import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class authService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> logIn(BuildContext context, String email_, String password_) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email_,
        password: password_,
      );
      // Navigate to main page on successful login
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle login error
      log("Failed to log in: $e");
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to log in: $e"),
        ),
      );
    }
  }

  Future<void> signUp(BuildContext context, String email_, String password_) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
            email: email_,
            password: password_,
      );

      DateTime _now = DateTime.now(); // get the current datetime
      
      Map<String, dynamic> userInitialData = {
        'email': email_,
        'name': "", //leave empty to fill in later
        'creation_time': _now,
        'friends':[],
      };
      await _firestore.collection('users').add(userInitialData); // add to firestore
      print('Data added successfully');

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

  String getUserEmail() {
    User? user = _auth.currentUser;
    if (user != null) { // there is a user
      if (user.email != null) {
        return user.email!;
      } else {
        return "No email associated with the user";
      }
    } else {
      return "Failed to grab user";
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      log("User logged out successfully");
      Navigator.pushReplacementNamed(context, '/login'); // return to login screen
    } catch (e) {
      log("Error logging out: $e");
    }
  }

}