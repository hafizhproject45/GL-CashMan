import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/text_styles.dart';

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
      padding: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          launchWhatsapp(contactNumber);
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          fixedSize: Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextPrimary.thin,
            )
          ],
        ),
      ),
    );
  }
}
