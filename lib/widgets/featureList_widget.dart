import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/utils/color_pallete.dart';
import '/utils/text_styles.dart';

class ListOfFeaturesWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;

  ListOfFeaturesWidget({
    required this.name,
    required this.icon,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/$route'),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: ColorPallete.primaryColor,
                ),
                Text(
                  name,
                  style: TextPrimary.thin,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorPallete.primaryColor,
                  size: 24,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
