import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/images.dart';
import '../../../core/utils/text_style.dart';
import '../global/button/my_button_widget.dart';

class ProfileBgSection extends StatefulWidget {
  const ProfileBgSection({
    super.key,
  });

  @override
  State<ProfileBgSection> createState() => _ProfileBgSectionState();
}

class _ProfileBgSectionState extends State<ProfileBgSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 250,
          width: screenWidth,
          child: const Image(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 30),
            const SizedBox(
              width: 370,
              child: Column(
                children: [
                  Text(
                    'Hallo,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Unknown user',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyButtonWidget(
              height: 45,
              width: 170,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Edit Profile',
                    style: AppTextStyle.bodyWhite,
                  ),
                ],
              ),
              onPressed: () => Get.toNamed('/profile/edit-profile'),
            )
          ],
        )
      ],
    );
  }
}
