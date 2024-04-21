import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/model/model_top_of_week.dart';
import 'package:book_bazar/widget/appbar_widget.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/dot_indicator.dart';
import '../../widget/top_of_week_card_widget.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  final PageController _mPageController = PageController();

  int _initPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _mPageController.addListener(() {
      setState(() {
        _initPageIndex = _mPageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.home,
          leadingIcon: Constant.searchIcon,
          actionIcon: Constant.notificationIcon,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                child: Stack(
                  children: [
                    PageView(
                      onPageChanged: (int index) {
                        setState(() {
                          _initPageIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      controller: _mPageController,
                      children: const [
                        SliderDataWidget(
                          slideImg: Constant.slideImg1,
                          discountText: Constant.discount25,
                        ),
                        SliderDataWidget(
                          slideImg: Constant.slideImg2,
                          discountText: Constant.discount10,
                        ),
                        SliderDataWidget(
                          slideImg: Constant.slideImg3,
                          discountText: Constant.discount30,
                        ),
                        SliderDataWidget(
                          slideImg: Constant.slideImg4,
                          discountText: Constant.discount45,
                        ),
                        SliderDataWidget(
                          slideImg: Constant.slideImg5,
                          discountText: Constant.discount50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height:
                      10), // Add some spacing between PageView and DotIndicator
              DotIndicator(
                width: 5,
                height: 5,
                itemCount: 5, // Number of pages
                currentIndex: _initPageIndex,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTitleOfView(Constant.topOfWeek, Constant.seeAll),
              SizedBox(
                height: 300,
                child: _buildTopOfWeekBook(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//OB Data Class
class SliderDataWidget extends StatelessWidget {
  final String slideImg;
  final String discountText;

  const SliderDataWidget({
    super.key,
    required this.slideImg,
    required this.discountText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constant.grey60,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constant.specialOffer,
                  style: Constant.slider1TextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  discountText,
                  style: Constant.slider2TextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: Constant.orderNow,
                  roundCorner: 50,
                  backgroundColor: Constant.appColor,
                  width: MediaQuery.of(context).size.width * .40,
                  height: 40,
                  textColor: Colors.white,
                  fontSize: 17,
                )
              ],
            ),
          ),
          Image.asset(
            slideImg,
          )
        ],
      ),
    );
  }
}

//TitleView
Widget _buildTitleOfView(String text1, String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1,
        style: Constant.headerTextStyle,
      ),
      Text(
        text2,
        style: Constant.seeAllTextStyle,
      ),
    ],
  );
}

Widget _buildTopOfWeekBook() => ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: ModelTopOfWeek.topOfWeekList.length,
      itemBuilder: (context, index) {
        final allItem = ModelTopOfWeek.topOfWeekList[index];
        return CardWidgetTopOfWeek(infoModel: allItem);
      },
    );
