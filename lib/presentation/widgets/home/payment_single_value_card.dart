import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';

class PaymentSingleCard extends StatelessWidget {
  final String value;
  final String title;

  const PaymentSingleCard({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 46,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 10,
            child: Text(
              title,
              style: AppTextStyle.mediumPrimary,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
