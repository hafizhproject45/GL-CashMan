import 'package:flutter/material.dart';

import '../../widgets/carousel_widget.dart';
import '../../styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                  SizedBox(height: 20),
                  Container(
                    height: 1,
                    width: screenWidth * 0.8,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(height: 30),
                  CarouselWidget(),
                  SizedBox(height: 30),
                  Container(
                    width: screenWidth * 0.8,
                    child: Text(
                      "${' ' * 5}Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextGrey.thin,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: screenWidth * 0.8,
                    child: Text(
                      "${' ' * 5}Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextGrey.thin,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
