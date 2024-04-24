import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/utils.dart';
import '../../database/db_helper.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/editext_widget.dart';

class ProfileMyAccount extends StatefulWidget {
  const ProfileMyAccount({super.key});

  @override
  State<ProfileMyAccount> createState() => _ProfileMyAccountState();
}

class _ProfileMyAccountState extends State<ProfileMyAccount> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    fetchData(); // Fetch user data from the database
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  // Fetch user data from the database
  void fetchData() async {
    Map<String, dynamic>? userData = await DBHelper.getUserData();
    if (userData != null) {
      setState(() {
        _nameController.text = userData['name'] ?? '';
        _emailController.text = userData['email'] ?? '';
        _phoneController.text = userData['phone'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.myAccount,
          leadingIcon: Constant.icon_arrowBack,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        fit: BoxFit.fill,
                        Constant.author1,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Change Profile',
                        style: Constant.normalTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Enter Your name',
                prefixIcon: Icons.person,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                controller: _nameController, // Assign the controller
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
                hintText: 'Enter Your Email',
                prefixIcon: Icons.email,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                // Changed to false for email field
                controller: _emailController, // Assign the controller
              ),
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
                hintText: 'Enter Your Phone Number',
                prefixIcon: Icons.phone,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                maxLength: 10,

                controller: _phoneController,
                // Assign the controller
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: 'Update Profile',
                roundCorner: 30,
                backgroundColor: Constant.appColor,
                width: MediaQuery.of(context).size.width * 1,
                textColor: Colors.white,
                onCLickButton: () async {
                  await DBHelper.insertOrUpdateUserDataTable(
                    _nameController.text,
                    _emailController.text,
                    _phoneController.text,
                  );

                  await DBHelper.insertOrUpdateAddressTable(
                    _nameController.text,
                    _emailController.text,
                    _phoneController.text,
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                  );

                  Utils.dialogUtils(context, 'Data Update Successfully');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
