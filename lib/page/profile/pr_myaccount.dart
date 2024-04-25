import 'dart:io';

import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/utils.dart';
import '../../database/db_helper.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/bottom_sheet/bottom_sheet_imagepicker_widget.dart';
import '../../widget/editext_widget.dart';

class ProfileMyAccount extends StatefulWidget {
  File? selectedImage;
  String? imagePath;

  ProfileMyAccount(this.selectedImage, this.imagePath, {super.key});

  @override
  State<ProfileMyAccount> createState() => _ProfileMyAccountState();
}

class _ProfileMyAccountState extends State<ProfileMyAccount> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  String? imagePathDB;

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
        imagePathDB = userData['image_path'] ?? Constant.author2;
      });
    }
    //For Profile Image--
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
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: _buildImageView(
                                context,
                                imagePathDB.toString(),
                              ),
                            );
                          },
                        );
                      },
                      child: ClipOval(
                        child: widget.selectedImage != null
                            ? Image.file(
                                widget.selectedImage!,
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,
                              )
                            : (imagePathDB != null && imagePathDB!.isNotEmpty)
                                ? Image.file(
                                    File(imagePathDB!),
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  )
                                : Image.asset(
                                    Constant.author2,
                                    // Assuming Constant.author2 contains the asset name
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () /*async*/ {
                        // await _requestStoragePermission();

                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return const BottomSheetImagePickerWidget(); // Display the bottom sheet
                          },
                        );
                      },
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
                keywordType: TextInputType.phone,
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
                  if (isValidate(context, _nameController, _emailController,
                      _phoneController)) {
                    await DBHelper.insertOrUpdateUserDataTable(
                      _nameController.text,
                      _emailController.text,
                      _phoneController.text,
                      widget.imagePath.toString(),
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
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidate(
  BuildContext context,
  TextEditingController _fullName,
  TextEditingController _email,
  TextEditingController _phone,
) {
  if (_fullName.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Full Name');
    return false;
  } else if (_email.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Email Address');
    return false;
  } else if (_phone.text.isEmpty && _phone.text.length < 10) {
    Utils.dialogUtils(context, 'Please Enter Phone number');
    return false;
  }

  return true;
}

Widget _buildImageView(BuildContext context, String imageFileName) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .50,
      child: Image.file(
        File(imageFileName),
        fit: BoxFit.fill,
      ),
    ),
  );
}
