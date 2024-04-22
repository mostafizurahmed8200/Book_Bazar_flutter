import 'package:book_bazar/%20connection/network_connection.dart';
import 'package:book_bazar/database/db_helper.dart';
import 'package:book_bazar/domain/firebase/firebase_loginauth.dart';
import 'package:book_bazar/domain/google/google_login.dart';
import 'package:book_bazar/widget/button_stroke_widget.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:book_bazar/widget/editext_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constant/constant.dart';
import '../constant/dart_algorithm.dart';
import '../constant/utils.dart';
import '../model/loginflag_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String getEmailText = ''; //Email Text
  String getPassword = '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constant.welcomeBack,
                  style: Constant.headerTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Constant.welcomeBackHint,
                  style: Constant.subHeaderTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: Constant.normalTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditTextWidget(
                  hintText: 'Your Email',
                  prefixIcon: Icons.email_rounded,
                  isAutocorrect: false,
                  isEnableSuggestion: true,
                  isObscureText: false,
                  controller: controllerEmail,
                  onChanged: (String value) {
                    setState(() {
                      getEmailText = controllerEmail.text.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password',
                  style: Constant.normalTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditTextWidget(
                  hintText: 'Your password',
                  prefixIcon: Icons.lock_rounded,
                  isAutocorrect: false,
                  isEnableSuggestion: true,
                  isObscureText: true,
                  controller: controllerPassword,
                  onChanged: (String value) {
                    setState(() {
                      getPassword = controllerPassword.text;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, 'forgetPasswordPage'),
                  child: const Text(
                    'Forget Password ?',
                    style: TextStyle(color: Constant.appColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: 'Login',
                  roundCorner: 50,
                  height: 50,
                  backgroundColor: Constant.appColor,
                  width: MediaQuery.of(context).size.width * .90,
                  textColor: Colors.white,
                  onCLickButton: () async {
                    if (isValidation(
                      context,
                      getEmailText,
                      getPassword,
                    )) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                      );

                      Future.delayed(
                        const Duration(seconds: 5),
                        () async {
                          Navigator.of(context).pop();

                          if ((await NetworkUtils.networkCalls())
                                  .contains(ConnectivityResult.mobile) ||
                              (await NetworkUtils.networkCalls())
                                  .contains(ConnectivityResult.wifi)) {
                            FirebaseLoginAuth.signInWithEmailAndPassword(
                                context,
                                email: controllerEmail.text,
                                password: controllerPassword.text);
                          } else {
                            Utils.dialogUtils(context,
                                'Please check your wifi - internet connection');
                          }
                        },
                      );
                      final loginFlag = LoginSqlModel(loginFlag: 'LoggedIn');
                      await DBHelper.insertSaladTable(loginFlag);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'signuppage'),
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Constant.appColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Or With'),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonStrokeWidget(
                  text: 'Sign in with Google',
                  iconData: Constant.icon_google,
                  roundCorner: 50,
                  height: 50,
                  width: MediaQuery.of(context).size.width * .90,
                  textColor: Colors.black,
                  onCLickButton: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          content: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    );

                    Future.delayed(
                      const Duration(seconds: 1),
                      () async {
                        Navigator.of(context).pop();
                        if ((await NetworkUtils.networkCalls())
                                .contains(ConnectivityResult.mobile) ||
                            (await NetworkUtils.networkCalls())
                                .contains(ConnectivityResult.wifi)) {
                          GoogleLogin.googleSignIn(context, googleSignIn);
                        } else {
                          Utils.dialogUtils(context,
                              'Please check your wifi - internet connection');
                        }
                      },
                    );

                    final loginFlag = LoginSqlModel(loginFlag: 'LoggedIn');
                    await DBHelper.insertSaladTable(loginFlag);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonStrokeWidget(
                  text: 'Sign in with Apple',
                  iconData: Constant.icon_apple,
                  roundCorner: 50,
                  height: 50,
                  width: MediaQuery.of(context).size.width * .90,
                  textColor: Colors.black,
                  onCLickButton: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidation(
    BuildContext context,
    String emailText,
    String passwordText,
  ) {
    if (emailText.isEmpty) {
      Utils.dialogUtils(context, "Please enter Email Address");
      return false;
    } else if (!Expression.containsAtEmailSymbol(emailText)) {
      Utils.dialogUtils(context, "Please enter valid Email Address");
      return false;
    } else if (passwordText.isEmpty) {
      Utils.dialogUtils(context, "Please enter your password");
      return false;
    }
    return true;
  }
}
