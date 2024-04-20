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
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: Constant.notification,
          leadingIcon: Constant.arrowBackIcon,
        ),
      ),
      body: EmptyItemWidget(
          icon: Constant.notificationIcon, text: "No Notification"),
    );
  }
}
