import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Constant.searchIcon,
                    width: 25,
                    height: 25,
                    color: Colors.black54,
                  ),
                  Text(
                    Constant.home,
                    style: Constant.headerTextStyle,
                  ),
                  Image.asset(
                    Constant.notificationIcon,
                    width: 25,
                    height: 25,
                    color: Colors.black54,
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
