import 'dart:ui';

class ModelOfferPromo {
  final Color offerColor;
  final String offerText;

  ModelOfferPromo({required this.offerColor, required this.offerText});

  static List<ModelOfferPromo> myOfferList = [
    ModelOfferPromo(
        offerColor: const Color(0xFF54408C), offerText: '50 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFF5BE00), offerText: '20 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFF3784FB), offerText: '30 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFFF8C39), offerText: '40 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFEF5A56), offerText: '55 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFF34A853), offerText: '70 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFF54408C), offerText: '100 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFF5BE00), offerText: '78 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFF3784FB), offerText: '80 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFFF8C39), offerText: '90 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFFEF5A56), offerText: '10 % \nOFF'),
    ModelOfferPromo(
        offerColor: const Color(0xFF34A853), offerText: '60 % \nOFF'),
  ];
}
