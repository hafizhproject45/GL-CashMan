// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gl_app/core/utils/colors.dart';
import 'package:gl_app/core/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({
    required this.name,
    required this.contactNumber,
    super.key,
  });

  final String name;
  final String contactNumber;

  void launchWhatsapp(contactNumber) async {
    Uri url = Uri.parse("https://wa.me/$contactNumber");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          launchWhatsapp(contactNumber);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          fixedSize: const Size.fromHeight(60),
          backgroundColor: AppColor.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: AppTextStyle.mediumWhite,
            )
          ],
        ),
      ),
    );
  }
}
