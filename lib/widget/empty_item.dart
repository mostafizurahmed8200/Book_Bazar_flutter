import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Constant.emptyCartIcon),
          SizedBox(
            height: 20,
          ),
          Text(
            'Empty Cart',
            style: Constant.headerTextStyle,
          )
        ],
      ),
    );
  }
}
