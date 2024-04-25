import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewWidget extends StatelessWidget {
  final String imageFileName;
  final String imageName;

  const ImageViewWidget(
      {super.key, required this.imageFileName, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .50,
        child: (imageFileName.isNotEmpty)
            ? Image.file(
                File(imageFileName),
                fit: BoxFit.fill,
              )
            : Image.asset(
                imageName,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
