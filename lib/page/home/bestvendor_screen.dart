import 'package:book_bazar/model/model_bestvendors.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/cardview/card_widget_bestvendors_see_all.dart';
import '../../widget/sliver_gridview_widget.dart';

class HomeBestVendorPage extends StatefulWidget {
  const HomeBestVendorPage({super.key});

  @override
  State<HomeBestVendorPage> createState() => _HomeBestVendorPageState();
}

class _HomeBestVendorPageState extends State<HomeBestVendorPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<ModelBestVendors> _vendorData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    _vendorData = _fetchCategoryData();
  }

  List<ModelBestVendors> _fetchCategoryData() {
    // Simulate fetching category data
    return ModelBestVendors
        .bestVendorList; // Replace this with your actual fetching logic
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
          title: Constant.bestVendor,
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
                  'Our Vendors',
                  style: Constant.header2TextStyle,
                ),
                const Text(
                  "Vendors",
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
                  Tab(text: 'Books'),
                  Tab(text: 'Poems'),
                  Tab(text: 'Special for you'),
                  Tab(text: 'Stationary'),
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
                  return _buildAllProductTabs(_vendorData);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAllProductTabs(List<ModelBestVendors> categoryList) {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
      crossAxisCount: 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      height: 200.0, //48 dp of height
    ),
    itemCount: categoryList.length,
    itemBuilder: (context, index) {
      final allItem = categoryList[index];
      return CardWidgetBestVendorsSeeAll(infoModel: allItem);
    },
    scrollDirection: Axis.vertical,
  );
}
