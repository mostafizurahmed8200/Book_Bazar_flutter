import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widget/appbar_widget.dart';
import '../widget/empty_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.notification,
          leadingIcon: Constant.icon_arrowBack,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const EmptyItemWidget(
          icon: Constant.icon_emptyNotification, text: "No Notification"),
    );
  }
}
