import 'package:book_bazar/model/model_authors.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/cardview/card_widget_author_see_all.dart';

class HomeAuthorsPage extends StatefulWidget {
  const HomeAuthorsPage({super.key});

  @override
  State<HomeAuthorsPage> createState() => _HomeAuthorsPageState();
}

class _HomeAuthorsPageState extends State<HomeAuthorsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<ModelAuthors> _authorList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    _authorList = _fetchCategoryData();
  }

  List<ModelAuthors> _fetchCategoryData() {
    // Simulate fetching category data
    return ModelAuthors
        .authorList; // Replace this with your actual fetching logic
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check the authors',
                  style: Constant.header2TextStyle,
                ),
                const Text(
                  Constant.authors,
                  style: TextStyle(
                      color: Constant.appColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                controller: tabController,
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
                  Tab(text: 'Poet'),
                  Tab(text: 'Playwrights'),
                  Tab(text: 'Novelist'),
                  Tab(text: 'Journalist'),
                ],
                padding: EdgeInsets.zero, // Add this line to remove padding
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: List.generate(5, (index) {
                  return _buildAllProductTabs(_authorList);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAllProductTabs(List<ModelAuthors> categoryList) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: categoryList.length,
    itemBuilder: (context, index) {
      final allItem = categoryList[index];
      return CardWidgetAuthorSeeAll(infoModel: allItem);
    },
  );
}
