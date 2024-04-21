import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';

class HomeAuthorsPage extends StatefulWidget {
  const HomeAuthorsPage({super.key});

  @override
  State<HomeAuthorsPage> createState() => _HomeAuthorsPageState();
}

class _HomeAuthorsPageState extends State<HomeAuthorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.authors,
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
