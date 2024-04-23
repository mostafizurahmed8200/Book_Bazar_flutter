import 'package:book_bazar/constant/constant.dart';

class ModelHelpCenter {
  final String logo;
  final String helpText;
  final String helpHintText;

  ModelHelpCenter(
      {required this.logo, required this.helpText, required this.helpHintText});

  static List<ModelHelpCenter> myOfferList = [
    ModelHelpCenter(
        logo: Constant.icon_emails,
        helpText: 'Email',
        helpHintText: 'Send to your email'),
    ModelHelpCenter(
        logo: Constant.icon_phones,
        helpText: 'Phone',
        helpHintText: 'Send to your phone'),
  ];
}
