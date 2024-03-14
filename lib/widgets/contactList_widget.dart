import 'package:flutter/material.dart';

import '/utils/color_pallete.dart';

class ContactList extends StatelessWidget {
  final String name;
  // final int phoneNumber;

  const ContactList({
    required this.name,
    // required this.phoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 7),
      child: ElevatedButton(
        onPressed: () {
          // launchUrl(whatsapp);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              size: 30,
            ),
            SizedBox(width: 16),
            Text(
              name,
              style: TextStyle(
                color: ColorPallete.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
