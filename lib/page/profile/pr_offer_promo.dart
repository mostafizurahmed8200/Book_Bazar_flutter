import 'package:book_bazar/widget/offer_promos_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../model/model_offer_promo.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/sliver_gridview_widget.dart';

class ProfileOfferPromo extends StatefulWidget {
  const ProfileOfferPromo({super.key});

  @override
  State<ProfileOfferPromo> createState() => _ProfileOfferPromoState();
}

class _ProfileOfferPromoState extends State<ProfileOfferPromo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Constant.appbarSize),
        child: AppBarWidget(
          title: Constant.offers,
          leadingIcon: Constant.icon_arrowBack,
          leadingOnCLickView: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Expanded(
          child: _buildOffer(),
        ),
      ),
    );
  }
}

Widget _buildOffer() => GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        height: 220.0, //48 dp of height
      ),
      itemCount: ModelOfferPromo.myOfferList.length,
      itemBuilder: (context, index) {
        final allItem = ModelOfferPromo.myOfferList[index];
        return OffersDesign(offerPromoModel: allItem);
      },
      scrollDirection: Axis.vertical,
    );
