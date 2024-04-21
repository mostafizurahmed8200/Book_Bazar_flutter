import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';

class HomeBestVendorPage extends StatefulWidget {
  const HomeBestVendorPage({super.key});

  @override
  State<HomeBestVendorPage> createState() => _HomeBestVendorPageState();
}

class _HomeBestVendorPageState extends State<HomeBestVendorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.bestVendor,
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
