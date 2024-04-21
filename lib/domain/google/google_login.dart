import 'package:book_bazar/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  static Future<void> googleSignIn(
      BuildContext context, GoogleSignIn googleSignIn) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        Navigator.pushNamed(context, 'homeScreenPage');
      } else {
        // User canceled the sign-in process
        Utils.dialogUtils(context, 'Sign in canceled');
      }
    } catch (error) {
      Utils.dialogUtils(context, 'Error signing in: $error');
      // Handle sign-in errors here
    }
  }

  static Future<void> googleSignOut(
      BuildContext context, GoogleSignIn googleSignIn) async {
    try {
      await googleSignIn.signOut();
      Navigator.pushNamed(
          context, 'loginPage'); // Navigate to your login page after logout
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error signing out'),
          content: Text('Error: $error'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
