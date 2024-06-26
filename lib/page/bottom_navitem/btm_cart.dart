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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.cart,
          actionIcon: Constant.icon_notification,
        ),
      ),
      body: const EmptyItemWidget(
          icon: Constant.icon_emptyCart, text: "Empty Cart"),
    );
  }
}
