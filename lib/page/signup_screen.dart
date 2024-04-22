import 'package:book_bazar/%20connection/network_connection.dart';
import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/constant/dart_algorithm.dart';
import 'package:book_bazar/constant/utils.dart';
import 'package:book_bazar/database/db_helper.dart';
import 'package:book_bazar/domain/firebase/firebase_createauth.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:book_bazar/widget/editext_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  String getName = '';
  String getEmailText = ''; //Email Text
  String getPhonNumberText = ''; //Email Text
  String getPassword = '';

  String getPasswordText8 = '';
  String getPasswordTextAtleast1number = '';
  String getPasswordTextAtleastLowercase = '';

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPhoneNumber.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

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
                Constant.signup,
                style: Constant.headerTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Constant.createAcHint,
                style: Constant.subHeaderTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              //Name
              Text(
                'Name',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Your name',
                prefixIcon: Icons.person,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                controller: controllerName,
                onChanged: (String value) {
                  getName = controllerName.text;
                },
              ),

              //Email
              const SizedBox(
                height: 10,
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

              //Phone Number-

              const SizedBox(
                height: 10,
              ),
              Text(
                'Phone Number',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Your Phone number',
                keywordType: TextInputType.phone,
                prefixIcon: Icons.phone,
                isAutocorrect: false,
                maxLength: 10,
                isEnableSuggestion: true,
                isObscureText: false,
                controller: controllerPhoneNumber,
                onChanged: (String value) {
                  setState(() {
                    getPhonNumberText = controllerPhoneNumber.text.toString();
                  });
                },
              ),

              //Password
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
                maxLength: 20,
                controller: controllerPassword,
                onChanged: (String value) {
                  setState(() {
                    getPassword = controllerPassword.text;
                    getPasswordText8 = controllerPassword.text;
                    getPasswordTextAtleast1number = controllerPassword.text;
                    getPasswordTextAtleastLowercase = controllerPassword.text;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Expression.containsNumber(getPasswordTextAtleast1number)
                            ? Icons.done_all
                            : Icons.done,
                        color: Expression.containsNumber(
                                getPasswordTextAtleast1number)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Atleast 1 number (1-9)',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Expression.containsLowerUpperCase(
                                getPasswordTextAtleast1number)
                            ? Icons.done_all
                            : Icons.done,
                        color: Expression.containsLowerUpperCase(
                                getPasswordTextAtleast1number)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Atleast lowercase or uppercase letters',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      (getPasswordText8.toString().length >= 8)
                          ? const Icon(
                              Icons.done_all,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.done,
                              color: Colors.grey,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Minimum 8 characters',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: 'Register',
                roundCorner: 50,
                height: 50,
                backgroundColor: Constant.appColor,
                width: MediaQuery.of(context).size.width * .90,
                textColor: Colors.white,
                onCLickButton: () {
                  if (isValidation(
                    context,
                    getName,
                    getEmailText,
                    getPhonNumberText,
                    getPassword,
                    getPasswordTextAtleast1number,
                    getPasswordTextAtleastLowercase,
                    getPasswordText8,
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
                        // final List<ConnectivityResult> connectivityResult =
                        //     await (Connectivity().checkConnectivity());

                        Navigator.of(context).pop();
                        if ((await NetworkUtils.networkCalls())
                                .contains(ConnectivityResult.mobile) ||
                            (await NetworkUtils.networkCalls())
                                .contains(ConnectivityResult.wifi)) {
                          FirebaseCreateAcAuth.registerUsingEmailPassword(
                            context,
                            name: controllerName.text,
                            email: controllerEmail.text,
                            password: controllerPassword.text,
                            phoneNumber: controllerPhoneNumber.text,
                          );
                          //Insert Table-
                          await DBHelper.insertUserDataTable(
                              controllerName.text,
                              controllerEmail.text,
                              controllerPhoneNumber.text,
                              controllerPassword.text);

                          Navigator.pushNamed(context, 'congratulationspage');
                        } else {
                          Utils.dialogUtils(context,
                              'Please check your wifi - internet connection');
                        }
                      },
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'loginpage'),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign in',
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
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'By clicking Register, you agree to our ',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms, Data Policy. ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Constant.appColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidation(
    BuildContext context,
    String name,
    String emailText,
    String phonNumberText,
    String passwordText,
    String atleast1number,
    String atleasetLowerUperCase,
    String minimum8digit,
  ) {
    if (name.isEmpty) {
      Utils.dialogUtils(context, "Please enter Your name");
      return false;
    } else if (emailText.isEmpty) {
      Utils.dialogUtils(context, "Please enter Email Address");
      return false;
    } else if (!Expression.containsAtEmailSymbol(emailText)) {
      Utils.dialogUtils(context, "Please enter valid Email Address");
      return false;
    } else if (phonNumberText.isEmpty) {
      Utils.dialogUtils(context, "Please Enter your phone number");
      return false;
    } else if (passwordText.isEmpty) {
      Utils.dialogUtils(context, "Please Create Password");
      return false;
    } else if (!Expression.containsNumber(atleast1number)) {
      Utils.dialogUtils(
          context, "Please enter At least one number type for password");
      return false;
    } else if (!Expression.containsLowerUpperCase(atleasetLowerUperCase)) {
      Utils.dialogUtils(context,
          "Please enter At least one lowercase and uppercase number for password");
      return false;
    } else if (minimum8digit.length < 8) {
      Utils.dialogUtils(context, "Please enter 8 Characters");
      return false;
    }
    return true;
  }
}
