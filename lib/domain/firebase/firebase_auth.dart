import 'package:book_bazar/constant/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FireAuth {
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
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      Utils.dialogUtils(context, 'FirebaseAuthException: ${e.message}');
    } catch (e) {
      Utils.dialogUtils(context, 'Error');
    }
    return user;
  }
}

// Your SignupPage widget remains unchanged
