import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final String? leadingIcon;
  final String? actionIcon;
  final Function? leadingOnCLickView;
  final Color leadingColor; // Make leadingColor non-nullable and final
  final Color titleColor; // Make leadingColor non-nullable and final

  const AppBarWidget({
    super.key,
    this.title,
    this.leadingIcon,
    this.actionIcon,
    this.leadingOnCLickView,
    this.leadingColor = Colors.black54, // Provide a default value here
    this.titleColor = Colors.black, // Provide a default value here
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
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
                        if (leadingOnCLickView != null) {
                          leadingOnCLickView!(); // Invoke the function if it's not null
                        }
                      },
                      child: SvgPicture.asset(
                        leadingIcon!,
                        width: 25,
                        height: 25,
                        color: leadingColor,
                      ),
                    ),
                  if (title != null)
                    Expanded(
                      child: Center(
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 27,
                              color: titleColor,
                              fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
