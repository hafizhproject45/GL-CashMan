import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/utils/colors.dart';
import '../../widgets/profile_bg_widget.dart';

class ReleasePage extends StatelessWidget {
  const ReleasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileBackgroundWidget(),
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                const Text('Catatan Rilis', style: AppTextStyle.heading),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: AppColor.primary,
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Versi saat ini:',
                        style: AppTextStyle.mediumWhite,
                      ),
                      Text(
                        'V 1.0.0',
                        style: AppTextStyle.bodyWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                children: const [
                  Text(
                    '# 1.0.0',
                    style: AppTextStyle.subHeading,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Awal rilis',
                    style: AppTextStyle.medium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          backgroundColor: Colors.white,
          foregroundColor: AppColor.primary,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
