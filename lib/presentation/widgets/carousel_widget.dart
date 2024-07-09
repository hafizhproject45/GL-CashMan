import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/images.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ImageSlideshow(
      width: screenWidth * 0.9,
      height: 200,
      initialPage: 0,
      indicatorColor: AppColor.primary,
      indicatorBackgroundColor: Colors.grey,
      autoPlayInterval: 5000,
      isLoop: true,
      children: [
        Image.asset(
          AppImages.bg,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppImages.bg,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppImages.bg,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
