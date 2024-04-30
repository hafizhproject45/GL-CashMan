import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gl_app/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../styles/color_pallete.dart';
import '../styles/text_styles.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

File? selectedImage;

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImageFromGallery();
      },
      child: selectedImage != null
          ? Container(
              width: selectedImage != null
                  ? MediaQuery.of(context).size.width
                  : 300,
              height: selectedImage != null
                  ? MediaQuery.of(context).size.width
                  : 300,
              decoration: selectedImage != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(selectedImage!),
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
            )
          : Column(
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [10, 5],
                  color: Colorz.primary,
                  radius: Radius.circular(10),
                  strokeWidth: 2,
                  stackFit: StackFit.loose,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colorz.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Colorz.primary,
                          size: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Foto Pembayaran',
                          style: TextPrimary.thin,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      int fileSize = await imageFile.length();

      if (fileSize > 300 * 1024) {
        dangerToast(message: 'Ukuran file tidak boleh lebih dari 300kb');
      } else {
        final croppedImage = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colorz.primary,
              cropGridColor: Colorz.primary,
              statusBarColor: Colorz.primary,
              cropFrameColor: Colorz.primary,
              activeControlsWidgetColor: Colorz.primary,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Crop Image',
            ),
          ],
        );

        if (croppedImage != null) {
          setState(() {
            selectedImage = File(croppedImage.path);
          });
        }
      }
    }
  }
}
