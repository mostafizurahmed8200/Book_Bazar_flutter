import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/constant.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final String? leadingIcon;
  final String? actionIcon;
  final Function? onCLickView;

  const AppBarWidget({
    super.key,
    this.title,
    this.leadingIcon,
    this.actionIcon,
    this.onCLickView,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leadingIcon != null)
                  GestureDetector(
                    onTap: () {
                      if (onCLickView != null) {
                        onCLickView!(); // Invoke the function if it's not null
                      }
                    },
                    child: SvgPicture.asset(
                      leadingIcon!,
                      width: 25,
                      height: 25,
                      color: Colors.black54,
                    ),
                  ),
                if (title != null)
                  Expanded(
                    child: Center(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: Constant.headerTextStyle,
                      ),
                    ),
                  ),
                if (actionIcon != null)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'notificationPage');
                    },
                    child: SvgPicture.asset(
                      actionIcon!,
                      width: 25,
                      height: 25,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
