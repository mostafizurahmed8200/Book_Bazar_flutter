import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/utils.dart';
import '../../database/db_helper.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/editext_widget.dart';

class ProfileAddress extends StatefulWidget {
  const ProfileAddress({super.key});

  @override
  State<ProfileAddress> createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  //Chip-
  bool isHomeSelected = false;
  bool isOfficeSelected = false;

  String chipText = '';

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _pincodeController;
  late TextEditingController _stateController;
  late TextEditingController _cityController;
  late TextEditingController _houseNumberController;
  late TextEditingController _landmarkController;

  @override
  void initState() {
    print('chipTextInt  --->$chipText');
    if (chipText.toString().trim() == 'Home') {
      setState(() {
        isHomeSelected = true;
      });
    } else if (chipText.toString().trim() == 'Office') {
      setState(() {
        isOfficeSelected = true;
      });
    }
    ;

    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _pincodeController = TextEditingController();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _houseNumberController = TextEditingController();
    _landmarkController = TextEditingController();
    fetchData();

    // Fetch user data from the database
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _pincodeController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _houseNumberController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  // Fetch user data from the database
  void fetchData() async {
    Map<String, dynamic>? userData = await DBHelper.getAddressData();
    if (userData != null) {
      setState(() {
        _nameController.text = userData['name'] ?? '';
        _emailController.text = userData['email'] ?? '';
        _phoneController.text = userData['phone'] ?? '';
        _pincodeController.text = userData['pincode'] ?? '';
        _stateController.text = userData['state'] ?? '';
        _cityController.text = userData['city'] ?? '';
        _houseNumberController.text = userData['house_number'] ?? '';
        _landmarkController.text = userData['landmark'] ?? '';
        chipText = userData['chip_data'] ?? '';
        // Set the state of isHomeSelected and isOfficeSelected based on chipText
        if (chipText == 'Home') {
          isHomeSelected = true;
        } else if (chipText == 'Office') {
          isOfficeSelected = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.address,
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
                height: 10,
              ),
              //Name
              Text(
                'Full Name',
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

              //Email--
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

              //Phone Number
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
              //Pincode-
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pincode',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Enter Your Pin Code',
                prefixIcon: Icons.keyboard_alt_outlined,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                maxLength: 6,
                keywordType: TextInputType.phone,
                controller: _pincodeController,
                // Assign the controller
              ),
              const SizedBox(
                height: 10,
              ),
              //State and City-
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'State',
                        style: Constant.normalTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EditTextWidget(
                        hintText: 'Enter Your State Name',
                        prefixIcon: Icons.home,
                        isAutocorrect: false,
                        isEnableSuggestion: true,
                        isObscureText: false,
                        maxLength: 10,

                        controller: _stateController,
                        // Assign the controller
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City',
                        style: Constant.normalTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EditTextWidget(
                        hintText: 'Enter Your City',
                        prefixIcon: Icons.location_city,
                        isAutocorrect: false,
                        isEnableSuggestion: true,
                        isObscureText: false,
                        maxLength: 10,

                        controller: _cityController,
                        // Assign the controller
                      ),
                    ],
                  ))
                ],
              ),

              //House No-
              const SizedBox(
                height: 10,
              ),
              Text(
                'House Number',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Enter Your House Number',
                prefixIcon: Icons.house,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                maxLength: 10,

                controller: _houseNumberController,
                // Assign the controller
              ),

              //Road Name-
              const SizedBox(
                height: 10,
              ),
              Text(
                'Landmark',
                style: Constant.normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              EditTextWidget(
                hintText: 'Enter Your Landmark',
                prefixIcon: Icons.shopify_outlined,
                isAutocorrect: false,
                isEnableSuggestion: true,
                isObscureText: false,
                maxLength: 10,

                controller: _landmarkController,
                // Assign the controller
              ),

              const SizedBox(
                height: 10,
              ),
              //Type of Address Chip-
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isHomeSelected = !isHomeSelected;
                        isOfficeSelected = false;
                        chipText = 'Home';
                      });
                    },
                    child: Chip(
                      shape: const StadiumBorder(),
                      label: const Text(Constant.home),
                      backgroundColor:
                          isHomeSelected ? Constant.appColor : Constant.grey60,
                      labelStyle: TextStyle(
                        color: isHomeSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOfficeSelected = !isOfficeSelected;
                        isHomeSelected = false;
                        chipText = 'Office';
                      });
                    },
                    child: Chip(
                      shape: const StadiumBorder(),
                      label: const Text('Office'),
                      backgroundColor: isOfficeSelected
                          ? Constant.appColor
                          : Constant.grey60,
                      labelStyle: TextStyle(
                        color: isOfficeSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: 'Confirmation Address',
                roundCorner: 30,
                backgroundColor: Constant.appColor,
                width: MediaQuery.of(context).size.width * 1,
                textColor: Colors.white,
                onCLickButton: () async {
                  if (isValidate(
                    context,
                    _nameController,
                    _emailController,
                    _phoneController,
                    _pincodeController,
                    _stateController,
                    _cityController,
                    _houseNumberController,
                    _landmarkController,
                    isHomeSelected,
                    isOfficeSelected,
                  )) {
                    await DBHelper.insertOrUpdateAddressTable(
                        _nameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _pincodeController.text,
                        _stateController.text,
                        _cityController.text,
                        _houseNumberController.text,
                        _landmarkController.text,
                        chipText.toString());
                    Utils.dialogUtils(context, 'Address Save  Successfully');
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
}

bool isValidate(
  BuildContext context,
  TextEditingController _fullName,
  TextEditingController _email,
  TextEditingController _phone,
  TextEditingController _pincode,
  TextEditingController _state,
  TextEditingController _city,
  TextEditingController _housenumber,
  TextEditingController _landmark,
  bool isHomeSelected,
  bool isOfficeSelected,
) {
  if (_fullName.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Full Name');
    return false;
  } else if (_email.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Email Address');
    return false;
  } else if (_phone.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Phone number');
    return false;
  } else if (_pincode.text.isEmpty && _pincode.text.length < 6) {
    Utils.dialogUtils(context, 'Please Enter pincode and it should be 6 digit');
    return false;
  } else if (_state.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter State Name');
    return false;
  } else if (_city.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter City Name');
    return false;
  } else if (_housenumber.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter House number');
    return false;
  } else if (_landmark.text.isEmpty) {
    Utils.dialogUtils(context, 'Please Enter Landmark Name');
    return false;
  } else if (!isHomeSelected && !isOfficeSelected) {
    Utils.dialogUtils(context, 'Please select Home or Office');
    return false;
  }

  return true;
}
