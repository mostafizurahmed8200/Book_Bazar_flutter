import 'package:book_bazar/model/model_helpcenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpCenterDesign extends StatelessWidget {
  final ModelHelpCenter helpCenter;

  // Make offerPromoModel final

  const HelpCenterDesign({super.key, required this.helpCenter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CupertinoColors.systemGrey6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(helpCenter.logo),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                helpCenter.helpText,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                helpCenter.helpHintText,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    ); // Remove 'const' as Placeholder isn't a const widget
  }
}
