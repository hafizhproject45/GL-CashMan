import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../core/utils/text_style.dart';

import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/auth/logout_usecase.dart';
import '../../../injection_container.dart';
import '../../widgets/global/button/my_button_widget.dart';
import '../../widgets/global/my_dialog_confirmation.dart';
import '../../widgets/profile/featureList_widget.dart';
import '../../widgets/profile/profile_bg_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileBgSection(),
            const ListOfFeaturesWidget(
              name: "Contact List",
              icon: Icons.contact_phone,
              route: 'profile/contact',
            ),
            const ListOfFeaturesWidget(
              name: "Frequently Asked Questions",
              icon: Icons.question_answer,
              route: 'profile/question',
            ),
            const ListOfFeaturesWidget(
              name: "About this Application",
              icon: Icons.info,
              route: 'profile/about',
            ),
            const SizedBox(height: 30),
            MyButtonWidget(
              buttonColor: Colors.red,
              width: screenWidth * 0.9,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  Text(
                    'Logout',
                    style: AppTextStyle.bodyWhite,
                  ),
                ],
              ),
              onPressed: () => _onLogout(context),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  void _onLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => DialogConfirmation(
        title: 'LOGOUT',
        text: 'Apakah anda yakin ingin keluar dari aplikasi?',
        onClick: () {
          Get.close(1);
          sl<LogoutUsecase>().call(NoParams());
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
