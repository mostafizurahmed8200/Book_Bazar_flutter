import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';

class HomeTopOfWeekPage extends StatefulWidget {
  const HomeTopOfWeekPage({super.key});

  @override
  State<HomeTopOfWeekPage> createState() => _HomeTopOfWeekPageState();
}

class _HomeTopOfWeekPageState extends State<HomeTopOfWeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.topOfWeek,
          leadingIcon: Constant.icon_arrowBack,
          actionIcon: Constant.icon_search,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
