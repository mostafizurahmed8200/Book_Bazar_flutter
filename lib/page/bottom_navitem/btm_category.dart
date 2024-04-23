import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../model/model_category.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/cardview/card_widget_category.dart';
import '../../widget/sliver_gridview_widget.dart';

class BottomNavigationCategory extends StatefulWidget {
  const BottomNavigationCategory({super.key});

  @override
  State<BottomNavigationCategory> createState() =>
      _BottomNavigationCategoryState();
}

class _BottomNavigationCategoryState extends State<BottomNavigationCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<ModelCategory> _categoryData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _categoryData = _fetchCategoryData();
  }

  List<ModelCategory> _fetchCategoryData() {
    // Simulate fetching category data
    return ModelCategory
        .categoryList; // Replace this with your actual fetching logic
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the tab controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.category,
          leadingIcon: Constant.icon_search,
          actionIcon: Constant.icon_notification,
          leadingOnCLickView: () {
            Navigator.pushNamed(context, 'searchPage');
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              controller: _tabController,
              labelStyle: const TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 17, color: Colors.grey),
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(text: 'Novels'),
                Tab(text: 'Self Loves'),
                Tab(text: 'Science'),
                Tab(text: 'Romantics'),
              ],
              padding: EdgeInsets.zero, // Add this line to remove padding
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(5, (index) {
                return _buildAllProductTabs(_categoryData);
              }),
            ),
          ),
        ],
      ),
    );
  } // Tab Products

  Widget _buildAllProductTabs(List<ModelCategory> categoryList) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
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
}
