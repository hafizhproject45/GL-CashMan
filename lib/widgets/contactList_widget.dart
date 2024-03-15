import 'package:flutter/material.dart';
import 'package:gl_app/utils/text_styles.dart';

class ContactListWidget extends StatelessWidget {
  final String name;
  // final int phoneNumber;

  const ContactListWidget({
    required this.name,
    // required this.phoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          // launchUrl(whatsapp);
        },
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
