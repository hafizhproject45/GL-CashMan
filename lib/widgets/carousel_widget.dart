import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../styles/color_pallete.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ImageSlideshow(
      width: screenWidth * 0.9,
      height: 200,
      initialPage: 0,
      indicatorColor: Colorz.primary,
      indicatorBackgroundColor: Colors.grey,
      children: [
        Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.cover,
        ),
      ],
      autoPlayInterval: 5000,
      isLoop: true,
    );
  }
}
