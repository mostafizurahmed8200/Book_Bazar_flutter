import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/widget/editext_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_sharp,
          size: 30,
        ),
      ),
      body: Padding(
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
            EditTextWidget(
              hintText: 'Your name',
              prefixIcon: Icons.person,
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
            EditTextWidget(
              hintText: 'Your Email',
              prefixIcon: Icons.email_rounded,
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
            ),
          ],
        ),
      ),
    );
  }
}
