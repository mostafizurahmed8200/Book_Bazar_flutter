import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

class Utils {
  static dialogUtils(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              // var height = MediaQuery.of(context).size.height;
              //var width = MediaQuery.of(context).size.width * .65;

              return SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                          fontSize: 20, color: Constant.appColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
