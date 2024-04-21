import 'package:book_bazar/widget/profile_data_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';

class BottomNavigationProfile extends StatefulWidget {
  const BottomNavigationProfile({super.key});

  @override
  State<BottomNavigationProfile> createState() =>
      _BottomNavigationProfileState();
}

class _BottomNavigationProfileState extends State<BottomNavigationProfile> {
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
                      ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          Constant.author1,
                          width: 60,
                          height: 60,
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
                            'AHMED',
                            style: Constant.normalTextStyle,
                          ),
                          Text(
                            '+91 9233443434',
                            style: Constant.subHeaderTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red, fontSize: 15),
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
                onClickItem: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_address,
                text: Constant.address,
                onClickItem: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_offer,
                text: Constant.offers,
                onClickItem: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_favorite,
                text: Constant.favorite,
                onClickItem: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_order,
                text: Constant.orderHistory,
                onClickItem: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileDataWidget(
                icon: Constant.pr_help,
                text: Constant.helpCenter,
                onClickItem: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
