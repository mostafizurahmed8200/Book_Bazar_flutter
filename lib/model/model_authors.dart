import 'package:book_bazar/constant/constant.dart';

class ModelAuthors {
  final String authorImg;
  final String authorName;
  final String authorTitle;
  final String authorDescription;

  ModelAuthors({
    required this.authorImg,
    required this.authorName,
    required this.authorTitle,
    required this.authorDescription,
  });

  static List<ModelAuthors> authorList = [
    ModelAuthors(
        authorImg: Constant.author1,
        authorName: 'Maria',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author2,
        authorName: 'Jhon',
        authorTitle: 'Novelist',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author3,
        authorName: 'Carlos',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author4,
        authorName: 'Hima',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author5,
        authorName: 'Mini',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author6,
        authorName: 'Auroia',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author7,
        authorName: 'Kartina',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author8,
        authorName: 'Hema',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
    ModelAuthors(
        authorImg: Constant.author9,
        authorName: 'Raul',
        authorTitle: 'Writer',
        authorDescription: Constant.loreposum),
  ];
}
