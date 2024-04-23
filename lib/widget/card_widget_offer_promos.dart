import 'package:book_bazar/model/model_offer_promo.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

class OffersDesign extends StatelessWidget {
  final ModelOfferPromo offerPromoModel;

  // Make offerPromoModel final

  const OffersDesign({super.key, required this.offerPromoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: offerPromoModel.offerColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                offerPromoModel.offerText,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  text: 'Copy',
                  roundCorner: 10,
                  backgroundColor: Colors.white,
                  height: 40,
                  width: MediaQuery.of(context).size.width * .30,
                  textColor: offerPromoModel.offerColor)
            ],
          ),
        ),
      ),
    ); // Remove 'const' as Placeholder isn't a const widget
  }
}
