import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: Constant.home,
          leadingIcon: Constant.searchIcon,
          actionIcon: Constant.notificationIcon,
        ),
      ),
    );
  }
}
