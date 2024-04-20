import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../constant/dart_algorithm.dart';
import '../constant/utils.dart';
import '../domain/firebase/firebase_auth.dart';
import '../widget/button_widget.dart';
import '../widget/editext_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  String getEmailText = ''; //Email Text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Constant.forgetPassword,
                style: Constant.headerTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Constant.forgetPasswordHint,
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
                hintText: 'example@gmail.com',
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
                height: 20,
              ),
              ButtonWidget(
                text: 'Send Link',
                roundCorner: 50,
                height: 50,
                backgroundColor: Constant.appColor,
                width: MediaQuery.of(context).size.width * .90,
                textColor: Colors.white,
                onCLickButton: () {
                  if (isValidation(context, getEmailText)) {
                    showDialog(
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
                      const Duration(seconds: 5),
                      () {
                        Navigator.of(context).pop();
                        FireAuth.resetPassword(
                          context,
                          email: controllerEmail.text,
                        );
                        Navigator.pushNamed(context, 'loginpage');
                      },
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidation(
    BuildContext context,
    String emailText,
  ) {
    if (emailText.isEmpty) {
      Utils.dialogUtils(context, "Please enter Email Address");
      return false;
    } else if (!Expression.containsAtEmailSymbol(emailText)) {
      Utils.dialogUtils(context, "Please enter valid Email Address");
      return false;
    }

    return true;
  }
}
