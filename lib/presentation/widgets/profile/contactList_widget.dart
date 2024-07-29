// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';

class PhoneListWidget extends StatelessWidget {
  const PhoneListWidget({
    required this.name,
    required this.phoneNumber,
    super.key,
  });

  final String name;
  final String phoneNumber;

  void launchWhatsapp(phoneNumber) async {
    Uri url = Uri.parse("https://wa.me/$phoneNumber");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          launchWhatsapp(phoneNumber);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          fixedSize: const Size.fromHeight(60),
          backgroundColor: Colors.grey.shade300,
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
              color: AppColor.primary,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: AppTextStyle.mediumBold,
            )
          ],
        ),
      ),
    );
  }
}
