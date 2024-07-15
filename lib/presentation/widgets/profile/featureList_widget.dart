// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/text_style.dart';
import '../../../core/utils/colors.dart';

class ListOfFeaturesWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;

  const ListOfFeaturesWidget({
    required this.name,
    required this.icon,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/$route'),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: AppColor.primary,
                ),
                Text(
                  name,
                  style: AppTextStyle.medium,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primary,
                  size: 24,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
