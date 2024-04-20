import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/empty_item.dart';

class BottomNavigationCart extends StatefulWidget {
  const BottomNavigationCart({super.key});

  @override
  State<BottomNavigationCart> createState() => _BottomNavigationCartState();
}

class _BottomNavigationCartState extends State<BottomNavigationCart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: Constant.cart,
          actionIcon: Constant.notificationIcon,
        ),
      ),
      body: EmptyItemWidget(),
    );
  }
}