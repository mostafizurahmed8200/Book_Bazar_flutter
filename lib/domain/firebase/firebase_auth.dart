import 'package:book_bazar/constant/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FireAuth {
  //Create Account Auth
  static Future<User?> registerUsingEmailPassword(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      DatabaseReference usersRef =
          FirebaseDatabase.instance.reference().child('users');

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;

      if (userCredential.user != null) {
        await usersRef.child(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          // 'password': password, // Store the encoded password
        });
      }
    } on FirebaseAuthException catch (e) {
      Utils.dialogUtils(context, 'FirebaseAuthException: ${e.message}');
    } catch (e) {
      Utils.dialogUtils(context, 'Error ${e}');
      print("error--->" 'Error ${e}');
    }
    return user;
  }

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
      Navigator.pushNamed(context, 'obpage');
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

  //Forget Password Link-
  static Future<void> resetPassword(
    BuildContext context, {
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // Password reset email sent successfully
      Utils.dialogUtils(
          context, 'Password reset email sent. Check your inbox.');
      // Show success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent. Check your inbox.'),
          duration: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      // Error sending password reset email
      Utils.dialogUtils(context, 'Failed to send password reset email');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
