import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';

class BottomNavigationCategory extends StatefulWidget {
  const BottomNavigationCategory({super.key});

  @override
  State<BottomNavigationCategory> createState() =>
      _BottomNavigationCategoryState();
}

class _BottomNavigationCategoryState extends State<BottomNavigationCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.category,
          leadingIcon: Constant.searchIcon,
          actionIcon: Constant.notificationIcon,
          leadingOnCLickView: () {
            Navigator.pushNamed(context, 'searchPage');
          },
        ),
      ),
    );
  }
}
