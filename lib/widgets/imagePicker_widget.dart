import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
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

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImageFromGallery();
      },
      child: _selectedImage != null
          ? Container(
              width: _selectedImage != null
                  ? MediaQuery.of(context).size.width
                  : 300,
              height: _selectedImage != null
                  ? MediaQuery.of(context).size.width
                  : 300,
              decoration: _selectedImage != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.contain,
                      ),
                    )
                  : null, // Jika gambar belum dipilih, tidak perlu ada dekorasi
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

  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colorz.primary,
              cropGridColor: Colorz.primary,
              statusBarColor: Colorz.primary,
              cropFrameColor: Colorz.primary,
              activeControlsWidgetColor: Colorz.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Image',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      if (croppedImage != null) {
        setState(() {
          _selectedImage = File(croppedImage.path);
        });
      }
    }
  }
}
