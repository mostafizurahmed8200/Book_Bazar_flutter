import 'package:book_bazar/widget/editext_widget.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widget/appbar_widget.dart';
import '../widget/empty_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.search,
          leadingIcon: Constant.icon_arrowBack,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: EditTextWidget(
                hintText: Constant.search,
                isEnableSuggestion: false,
                isObscureText: false,
                prefixIcon: Icons.search,
                isAutocorrect: false,
              ),
            ),
            Expanded(
              child: EmptyItemWidget(
                  width: 200,
                  height: 200,
                  color: Constant.grey60,
                  icon: Constant.icon_search,
                  text: "Empty Search"),
            ),
          ],
        ),
      ),
    );
  }
}
