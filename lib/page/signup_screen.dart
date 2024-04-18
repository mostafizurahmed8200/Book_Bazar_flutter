import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/constant/dart_algorithm.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:book_bazar/widget/editext_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController controller = TextEditingController();
  String getPasswordText8 = '';
  String getPasswordTextAtleast1number = '';
  String getPasswordTextAtleastLowercase = '';

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
              Text(
                'Name',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const EditTextWidget(
                hintText: 'Your name',
                prefixIcon: Icons.person,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
              ),
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
              const EditTextWidget(
                hintText: 'Your Email',
                prefixIcon: Icons.email_rounded,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
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
                controller: controller,
                onChanged: (String value) {
                  setState(() {
                    getPasswordText8 = controller.text;
                    getPasswordTextAtleast1number = controller.text;
                    getPasswordTextAtleastLowercase = controller.text;
                    print('getText ${controller.text}');
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
                      (getPasswordText8.toString().length == 8)
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
                  const SizedBox(
                    height: 10,
                  ),
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
                        Expression.containsLowerCase(
                                getPasswordTextAtleast1number)
                            ? Icons.done_all
                            : Icons.done,
                        color: Expression.containsLowerCase(
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
                  textColor: Colors.white),
              const SizedBox(
                height: 20,
              ),
              Center(
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
}
