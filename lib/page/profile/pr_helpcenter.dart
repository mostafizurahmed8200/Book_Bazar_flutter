import 'package:book_bazar/model/model_helpcenter.dart';
import 'package:book_bazar/widget/cardview/card_widget_helpcenter.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/sliver_gridview_widget.dart';

class ProfileHelpCenter extends StatefulWidget {
  const ProfileHelpCenter({super.key});

  @override
  State<ProfileHelpCenter> createState() => _ProfileHelpCenterState();
}

class _ProfileHelpCenterState extends State<ProfileHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.appColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.helpCenter,
          leadingIcon: Constant.icon_arrowBack,
          leadingColor: Colors.white,
          titleColor: Colors.white,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            color: Constant.appColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                textAlign: TextAlign.center,
                "Tell us how we can help 👋 \nChapter are standing by for service & support!",
                style: TextStyle(fontSize: 22, color: Colors.grey.shade200),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildOffer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildOffer() => GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        height: 160.0, //48 dp of height
      ),
      itemCount: ModelHelpCenter.myOfferList.length,
      itemBuilder: (context, index) {
        final allItem = ModelHelpCenter.myOfferList[index];
        return HelpCenterDesign(helpCenter: allItem);
      },
      scrollDirection: Axis.vertical,
    );
