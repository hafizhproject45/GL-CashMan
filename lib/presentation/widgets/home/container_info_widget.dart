// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';

class ContainerInfoWidget extends StatelessWidget {
  final String label;
  final int? value;
  final Color mainColor;
  final Color subColor;
  final Widget iconz;

  const ContainerInfoWidget({
    required this.label,
    this.value = 0,
    required this.mainColor,
    required this.subColor,
    required this.iconz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: subColor,
                shape: BoxShape.circle,
              ),
              child: iconz,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$value', style: AppTextStyle.headingWhite),
                const SizedBox(height: 4),
                Text(label, style: AppTextStyle.mediumWhite),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
