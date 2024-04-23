import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/constant.dart';
import '../../database/db_helper.dart';
import '../../widget/appbar_widget.dart';

class ProfileAddressMain extends StatefulWidget {
  const ProfileAddressMain({super.key});

  @override
  State<ProfileAddressMain> createState() => _ProfileAddressMainState();
}

class _ProfileAddressMainState extends State<ProfileAddressMain> {
  //Chip-
  bool isHomeSelected = false;
  bool isOfficeSelected = false;

  String pinCodeText = '';
  String stateText = '';
  String cityText = '';
  String landmarkText = '';
  String houseNumberText = '';
  String chipText = '';

  @override
  void initState() {
    fetchData();
    super.initState();

    ;

    // Fetch user data from the database
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Fetch user data from the database
  void fetchData() async {
    Map<String, dynamic>? userData = await DBHelper.getAddressData();
    if (userData != null) {
      setState(() {
        pinCodeText = userData['pincode'] ?? '';
        stateText = userData['state'] ?? '';
        cityText = userData['city'] ?? '';
        houseNumberText = userData['house_number'] ?? '';
        landmarkText = userData['landmark'] ?? '';
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
    return PopScope(
      canPop: false,
      child: Scaffold(
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
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Image.asset(
                    'image/g_maps.jpg',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 100,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        Constant.bottomSheetBarBg,
                        // color: Colors.grey,
                        height: 8,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Row Delivery Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Address',
                          style: Constant.slider1TextStyle,
                        ),
                        SvgPicture.asset(Constant.icon_targetlocation)
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //Row Details Address-
                    _buildAddress(context, pinCodeText, stateText, cityText,
                        landmarkText, houseNumberText, chipText),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Text(
                      'Saved Address As',
                      style: Constant.slider1TextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Chip
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
                            backgroundColor: isHomeSelected
                                ? Constant.appColor
                                : Constant.grey60,
                            labelStyle: TextStyle(
                              color:
                                  isHomeSelected ? Colors.white : Colors.black,
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
                              color: isOfficeSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAddress(
    BuildContext context,
    String pinCodeText,
    String stateText,
    String cityText,
    String landmarkText,
    String houseNumberText,
    String chipText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: Constant.grey60,
        child: SvgPicture.asset(Constant.pr_address),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        // Wrap the Column with Expanded to allow the Text to wrap
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$landmarkText.$houseNumberText",
                  style: Constant.slider1TextStyle,
                ),
                ButtonWidget(
                    onCLickButton: () {
                      Navigator.pushNamed(
                        context,
                        'profileAddress',
                      );
                    },
                    text: 'Change',
                    roundCorner: 30,
                    backgroundColor: Constant.appColorLight,
                    width: 80,
                    height: 25,
                    fontSize: 13,
                    textColor: Colors.white)
              ],
            ),
            const SizedBox(
              height: 5, // Add some spacing between the two Text widgets
            ),
            Text(
              "Landmark-$landmarkText ,City-  $cityText,State -$stateText , Pin Code- $pinCodeText  ",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              softWrap:
                  true, // Allow the text to wrap if it exceeds the available width
            ),
          ],
        ),
      ),
    ],
  );
}
