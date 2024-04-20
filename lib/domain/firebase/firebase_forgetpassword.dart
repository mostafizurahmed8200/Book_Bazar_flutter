import 'package:book_bazar/constant/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthForgetPassword {
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
