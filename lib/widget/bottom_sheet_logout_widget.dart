import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/database/db_helper.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetLogoutWidget extends StatelessWidget {
  const BottomSheetLogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final halfScreenHeight = screenHeight / 1;

    return SizedBox(
      height: screenHeight * .30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
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
            Text(
              Constant.logout,
              style: Constant.headerTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Constant.logoutInfo,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: Constant.logout,
                    roundCorner: 30,
                    backgroundColor: Constant.appColor,
                    width: MediaQuery.of(context).size.width * 1,
                    textColor: Colors.white,
                    onCLickButton: () async {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'loginpage', (route) => false);
                      await DBHelper.deleteLoginFlag();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    Constant.cancel,
                    style: TextStyle(
                        fontSize: 20,
                        color: Constant.appColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
