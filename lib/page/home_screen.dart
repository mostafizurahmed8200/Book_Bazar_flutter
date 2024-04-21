import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/constant.dart';
import 'bottom_navitem/btm_cart.dart';
import 'bottom_navitem/btm_category.dart';
import 'bottom_navitem/btm_home.dart';
import 'bottom_navitem/btm_profile.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _selectedItemIndex = 0;
  // late int _previousItemIndex;

  final List<Widget> _pages = [
    const BottomNavigationHome(),
    const BottomNavigationCategory(),
    const BottomNavigationCart(),
    const BottomNavigationProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedItemIndex != 0) {
          setState(() {
            // _previousItemIndex = _selectedItemIndex;
            _selectedItemIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: _pages[_selectedItemIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildIcon(Constant.homeIcon, 0),
                label: Constant.home,
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Constant.categoryIcon, 1),
                label: Constant.category,
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Constant.cartIcon, 2),
                label: Constant.cart,
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Constant.profileIcon, 3),
                label: Constant.profile,
              ),
            ],
            currentIndex: _selectedItemIndex,
            backgroundColor: Constant.grey50,
            selectedItemColor: Constant.appColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    final isSelected = index == _selectedItemIndex;
    return SvgPicture.asset(
      assetPath,
      width: 25,
      height: 25,
      color: isSelected ? Constant.appColor : Constant.grey500,
    );
  }
}
