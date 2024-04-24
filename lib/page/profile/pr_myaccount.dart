import 'dart:io';

import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
  File? _selectedImage;
  String? imagePath;
  String? imagePathDB;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        imagePath = image.path;
        print('ImagePathFile-- $_selectedImage');
        print('ImagePath-- ${imagePath}');
      });
    }
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      // Open the gallery to pick an image
      await _pickImage();
    } else if (status.isDenied) {
      // Show a message to the user explaining why the permission is needed
      Utils.dialogUtils(context,
          'Storage permission is required to change your profile picture.');
    } else if (status.isPermanentlyDenied) {
      // Open the app settings so the user can manually grant the permission
      openAppSettings();
    }
  }

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
                    ClipOval(
                      child: _selectedImage != null
                          ? Image.file(
                              _selectedImage!,
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            )
                          : Image.file(
                              File(imagePathDB
                                  .toString()), // Assuming Constant.author2 contains the asset name
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _requestStoragePermission();
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
                    imagePath.toString(),
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
