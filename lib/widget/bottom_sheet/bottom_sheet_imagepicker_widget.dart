import 'dart:io';

import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constant/utils.dart';

class BottomSheetImagePickerWidget extends StatefulWidget {
  final Function(File)? onImageSelected; // Define callback function
  final Function(String)? imagePathString; // Define callback function

  const BottomSheetImagePickerWidget({
    super.key,
    this.onImageSelected,
    this.imagePathString,
  });

  @override
  State<BottomSheetImagePickerWidget> createState() =>
      _BottomSheetImagePickerWidgetState();
}

class _BottomSheetImagePickerWidgetState
    extends State<BottomSheetImagePickerWidget> {
  File? _selectedImage;
  String? imagePath;

  /*Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        imagePath = image.path;

        print('ImagePathFile-- $_selectedImage');
        print('ImagePath-- ${imagePath}');
        if (widget.onImageSelected != null) {
          widget.onImageSelected!(_selectedImage!); // Pass selected image
        }

        if (widget.imagePathString != null) {
          widget.imagePathString!(imagePath!); // Pass selected image
        }
        Navigator.pop(context);
      });
    }
  }*/

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        imagePath = image.path;

        if (widget.onImageSelected != null) {
          widget.onImageSelected!(_selectedImage!); // Pass selected image
        }

        if (widget.imagePathString != null) {
          widget.imagePathString!(imagePath!); // Pass selected image
        }
        Navigator.pop(context);
      });
    }
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      // Open the gallery to pick an image
      await _pickImage(ImageSource.gallery);
    } else if (status.isDenied) {
      // Show a message to the user explaining why the permission is needed
      Utils.dialogUtils(context,
          'Storage permission is required to change your profile picture.');
    } else if (status.isPermanentlyDenied) {
      // Open the app settings so the user can manually grant the permission
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * .30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SvgPicture.asset(
                Constant.bottomSheetBarBg,
                // color: Colors.grey,
                height: 8,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pickup Image from Camera or Gallery',
              style: Constant.headerTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final status = await Permission.camera.request();
                      if (status.isGranted) {
                        await _pickImage(ImageSource.camera);
                      } else if (status.isDenied) {
                        Utils.dialogUtils(context,
                            'Camera permission is required to take a picture.');
                      } else if (status.isPermanentlyDenied) {
                        openAppSettings();
                      }
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black38, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Constant.icon_camera,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: Constant.normalTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await _requestStoragePermission();
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black38, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Constant.icon_gallery,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: Constant.normalTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
