import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/question_container_widget.dart';
import '../../widgets/profile_bg_widget.dart';
import '../../styles/text_styles.dart';
import '../../styles/color_pallete.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileBackgroundWidget(),
          SizedBox(height: 40),
          Center(
            child: Text('Pertanyaan & Jawaban', style: TextPrimary.header),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                children: [
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
                        'Tidak bisa, maka lebih teliti lah untuk register akun. Opsinya adalah membuat akun kembali, namun hubungi kontak admin terlebih dahulu',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          foregroundColor: Colorz.primary,
        ),
      ),
    );
  }
}
