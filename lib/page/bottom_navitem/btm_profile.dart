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
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarWidget(
          title: Constant.profile,
        ),
      ),
    );
  }
}
