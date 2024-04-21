import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDataWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Function? onClickItem;

  const ProfileDataWidget(
      {super.key, required this.icon, required this.text, this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClickItem != null) {
          onClickItem!(); // Invoke the function if it's not null
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Constant.grey60,
                child: SvgPicture.asset(icon),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: Constant.normalTextStyle,
              )
            ],
          ),
          SvgPicture.asset(Constant.pr_arrowgo)
        ],
      ),
    );
  }
}
