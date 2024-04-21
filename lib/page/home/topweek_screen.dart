import 'package:book_bazar/model/model_category.dart';
import 'package:book_bazar/widget/card_widget_category.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/sliver_gridview_widget.dart';

class HomeTopOfWeekPage extends StatefulWidget {
  const HomeTopOfWeekPage({super.key});

  @override
  State<HomeTopOfWeekPage> createState() => _HomeTopOfWeekPageState();
}

class _HomeTopOfWeekPageState extends State<HomeTopOfWeekPage> {
  late List<ModelCategory> _topOfWeakList;
  @override
  void initState() {
    super.initState();

    _topOfWeakList = _fetchCategoryData();
  }

  List<ModelCategory> _fetchCategoryData() {
    // Simulate fetching category data
    return ModelCategory
        .categoryList; // Replace this with your actual fetching logic
  }

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
      body: _buildAllProductTabs(_topOfWeakList),
    );
  }
}

Widget _buildAllProductTabs(List<ModelCategory> categoryList) {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
      crossAxisCount: 2,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      height: 220.0, //48 dp of height
    ),
    itemCount: categoryList.length,
    itemBuilder: (context, index) {
      final allItem = categoryList[index];
      return CardWidgetCategory(infoModel: allItem);
    },
    scrollDirection: Axis.vertical,
  );
}
