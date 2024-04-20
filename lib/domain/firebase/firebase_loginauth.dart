import 'package:book_bazar/constant/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLoginAuth {
  //Login Auth
  static Future<void> signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Signed in
      User user = userCredential.user!;
      print('user $user');
      Navigator.pushNamed(context, 'homeScreenPage');
    } catch (e) {
      // Error signing in
      Utils.dialogUtils(context, 'Failed to sign in');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
