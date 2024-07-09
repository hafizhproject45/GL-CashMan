import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import '../../core/usecases/usecase.dart';
import '../../core/utils/images.dart';
import '../../domain/usecases/auth/logout_usecase.dart';
import '../../injection_container.dart';
import 'global/my_dialog_confirmation.dart';

class ProfileBackgroundWidget extends StatefulWidget {
  const ProfileBackgroundWidget({
    super.key,
  });

  @override
  State<ProfileBackgroundWidget> createState() =>
      _ProfileBackgroundWidgetState();
}

class _ProfileBackgroundWidgetState extends State<ProfileBackgroundWidget> {
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
            const SizedBox(height: 60),
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
            const SizedBox(height: 10),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _onLogout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size.fromWidth(130),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        )
      ],
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
