import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/profile/profile_bg_section.dart';
import '../../widgets/profile/question_container_widget.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileBgSection(),
          const SizedBox(height: 20),
          const Center(
            child:
                Text('Frequently Asked Questions', style: AppTextStyle.heading),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                QuestionContainerWidget(
                  question:
                      'Apakah password ketika register harus sama dengan password Email?',
                  answer: 'Tidak, password di register tidak harus sama',
                ),
                QuestionContainerWidget(
                  question: 'Bagaimana jika lupa password?',
                  answer:
                      'Anda dapat menghubungi Whatsapp admin yang ada di list kontak',
                ),
                QuestionContainerWidget(
                  question: 'Apakah Email bisa diganti?',
                  answer:
                      'Tidak bisa, maka lebih teliti untuk register akun. Opsinya adalah membuat akun kembali, namun hubungi kontak admin terlebih dahulu',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
