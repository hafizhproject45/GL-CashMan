import 'package:flutter/material.dart';
import 'package:gl_app/widgets/carousel_widget.dart';
import '../../styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Selamat datang di ',
                    style: TextPrimary.thin,
                  ),
                  Text('Aplikasi GL Manager', style: TextPrimary.header),
                  SizedBox(height: 30),
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(height: 30),
                  CarouselWidget(),
                  SizedBox(height: 30),
                  Container(
                    width: 350,
                    child: Text(
                      '${' ' * 5}this page issdlfjlskdjfkldsjjfljdskfjdskljfsdjfkljdsjflksdjfkjsdkfjldsjflsdjlfjkldsjfkjsdklfjdjfldsjflsjdfjsdfjdsjfldskjfsdjfsdjlfjsdfjsdkjfksdjfkjsdkfjlksdjfkdsjfkjsdfjldskfjsdjdksfjlj built with flutter-web. For a better user experience, please use a mobile device to open this link.lasjdlfjlsdkjfljdslkfjkldsjfkldsjflk',
                      style: TextGrey.thin,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 350,
                    child: Text(
                      '${' ' * 5}this page issdlfjlskdjfkldsjjfljdskfjdskljfsdjfkljdsjflksdjfkjsdkfjldsjflsdjlfjkldsjfkjsdklfjdjfldsjflsjdfjsdfjdsjfldskjfsdjfsdjlfjsdfjsdkjfksdjfkjsdkfjlksdjfkdsjfkjsdfjldskfjsdjdksfjlj built with flutter-web. For a better user experience, please use a mobile device to open this link.lasjdlfjlsdkjfljdslkfjkldsjfkldsjflk',
                      style: TextGrey.thin,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
