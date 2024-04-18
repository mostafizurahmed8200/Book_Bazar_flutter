import 'package:book_bazar/widget/button_widget.dart';
import 'package:book_bazar/widget/editext_widget.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  Constant.welcomeback,
                  style: Constant.headerTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Constant.welcomebackHint,
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
                  // controller: controllerEmail,
                  // onChanged: (String value) {
                  //   setState(() {
                  //     getEmailText = controllerEmail.text.toString();
                  //   });
                  //},
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
                  maxLength: 8,
                  // controller: controllerPassword,
                  // onChanged: (String value) {
                  //   setState(() {
                  //     getPassword = controllerPassword.text;
                  //     getPasswordText8 = controllerPassword.text;
                  //     getPasswordTextAtleast1number = controllerPassword.text;
                  //     getPasswordTextAtleastLowercase = controllerPassword.text;
                  //   });
                  // },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Forget Password ?',
                  style: TextStyle(color: Constant.appColor),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
