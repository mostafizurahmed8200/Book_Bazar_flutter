import 'dart:io';

import 'package:book_bazar/widget/profile_data_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../database/db_helper.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/bottom_sheet/bottom_sheet_logout_widget.dart';
import '../../widget/image_file_view_widget.dart';

class BottomNavigationProfile extends StatefulWidget {
  const BottomNavigationProfile({super.key});

  @override
  State<BottomNavigationProfile> createState() =>
      _BottomNavigationProfileState();
}

class _BottomNavigationProfileState extends State<BottomNavigationProfile> {
  late String name = 'Admin';
  late String phone = '+91 983XXXXXX';
  String? imagePathDB;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch user data from the database
  }

  // Fetch user data from the database
  void fetchData() async {
    Map<String, dynamic>? userData = await DBHelper.getUserData();
    if (userData != null) {
      setState(() {
        name = userData['name'] ?? 'Admin';
        phone = userData['phone'] ?? '+91 983XXXXXX';
        imagePathDB = userData['image_path'] ?? Constant.author2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.profile,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Divider(
                color: Colors.grey.shade200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: ImageViewWidget(
                                  imageFileName: imagePathDB.toString(),
                                  imageName: Constant.author2,
                                ),
                              );
                            },
                          );
                        },
                        child: ClipOval(
                          child: imagePathDB != null
                              ? Image.file(
                                  File(imagePathDB.toString()),
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                )
                              : Image.asset(
                                  Constant.author2,
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.isEmpty ? 'admin' : name,
                            style: Constant.normalTextStyle,
                          ),
                          Text(
                            phone.isEmpty ? '+91 983XXXXXX' : '+91 $phone',
                            style: Constant.subHeaderTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
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
                          return const BottomSheetLogoutWidget(); // Display the bottom sheet
                        },
                      );
                      // Navigator.pushNamed(context, "");
                    },
                    child: const Text(
                      Constant.logout,
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_person,
                text: Constant.myAccount,
                onClickItem: () {
                  Navigator.pushNamed(context, "profileMyAccount");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_address,
                text: Constant.address,
                onClickItem: () {
                  Navigator.pushNamed(context, "profileAddressMain");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_offer,
                text: Constant.offers,
                onClickItem: () {
                  Navigator.pushNamed(context, "profileOffer");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_favorite,
                text: Constant.favorite,
                onClickItem: () {
                  Navigator.pushNamed(context, "");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_order,
                text: Constant.orderHistory,
                onClickItem: () {
                  Navigator.pushNamed(context, "");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_help,
                text: Constant.helpCenter,
                onClickItem: () {
                  Navigator.pushNamed(context, "profileHelpCenter");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
