import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';

class PaymentMultiValueCard extends StatelessWidget {
  final String title;
  final String month;
  final String year;

  const PaymentMultiValueCard({
    super.key,
    required this.title,
    required this.month,
    required this.year,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month,
                    style: AppTextStyle.headingPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    year,
                    style: AppTextStyle.mediumPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
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
