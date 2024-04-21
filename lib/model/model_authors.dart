import 'package:book_bazar/constant/constant.dart';

class ModelAuthors {
  final String authorImg;
  final String authorName;
  final String authorTitle;

  ModelAuthors(
      {required this.authorImg,
      required this.authorName,
      required this.authorTitle});

  static List<ModelAuthors> topOfWeekList = [
    ModelAuthors(
        authorImg: Constant.author1,
        authorName: 'Maria',
        authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author2,
        authorName: 'Jhon',
        authorTitle: 'Novelist'),
    ModelAuthors(
        authorImg: Constant.author3,
        authorName: 'Carlos',
        authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author4, authorName: 'Hima', authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author5, authorName: 'Mini', authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author6,
        authorName: 'Auroia',
        authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author7,
        authorName: 'Kartina',
        authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author8, authorName: 'Hema', authorTitle: 'Writer'),
    ModelAuthors(
        authorImg: Constant.author9, authorName: 'Raul', authorTitle: 'Writer'),
  ];
}
