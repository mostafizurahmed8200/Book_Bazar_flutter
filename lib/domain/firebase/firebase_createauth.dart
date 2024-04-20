import 'package:book_bazar/constant/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseCreateAcAuth {
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

      DatabaseReference userRef = FirebaseDatabase.instance.ref('users');

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      // updatePhotoURL and updateDisplayName instead
      await user.reload();
      user = auth.currentUser;

      await userRef.push().set(
        {
          'uid': userCredential.user!.uid,
          'name': name,
          'email': email,
          'password': password, // Store the encoded password
        },
      );

      print("Credential--->"
          'name $name \n Email $email \n password $password');

      print("Credential--->"
          'name $name \n Email $email \n password $password');
    } on FirebaseAuthException catch (e) {
      Utils.dialogUtils(context, 'FirebaseAuthException: ${e.message}');
    } catch (e) {
      Utils.dialogUtils(context, 'Error ${e}');
      print("error--->" 'Error ${e}');
    }
    return user;
  }
}
