import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/constant.dart';
import '../model/model_category.dart';
import '../widget/appbar_widget.dart';
import '../widget/cardview/card_widget_category.dart';
import '../widget/sliver_gridview_widget.dart';

class AuthorDetailsPage extends StatefulWidget {
  final String authorImage;
  final String authorTitle;
  final String authorName;

  const AuthorDetailsPage(
      {super.key,
      required this.authorImage,
      required this.authorTitle,
      required this.authorName});

  @override
  State<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  late List<ModelCategory> _categoryData;

  @override
  void initState() {
    super.initState();
    _categoryData = _fetchCategoryData();
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
          title: Constant.authors,
          leadingIcon: Constant.icon_arrowBack,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    fit: BoxFit.fill,
                    widget.authorImage,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.authorTitle,
                  style: Constant.normalTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.authorName,
                  style: Constant.headerTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Constant.icon_review),
                    SvgPicture.asset(Constant.icon_review),
                    SvgPicture.asset(Constant.icon_review),
                    SvgPicture.asset(Constant.icon_review),
                    SvgPicture.asset(
                      Constant.icon_review,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'About',
              style: Constant.slider1TextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.authorName} was born and raised in South Bend, Indiana.She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Product',
              style: Constant.slider1TextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SizedBox(
              child: _buildAllProductTabs(_categoryData),
            ))
          ],
        ),
      ),
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
