import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles/text_styles.dart';
import '../../styles/color_pallete.dart';

class ReleaseScreen extends StatelessWidget {
  ReleaseScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 250,
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Hafizh Athallah Y.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                children: [
                  Center(
                    child: Text('Catatan Rilis', style: TextPrimary.header),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colorz.primary,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Versi saat ini:',
                            style: TextWhite.thin,
                          ),
                          Text(
                            'V 1.1.0',
                            style: TextWhite.body,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    '# 1.0.0',
                    style: TextPrimary.subHeader,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Awal rilis',
                    style: TextGrey.thin,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '# 1.1.0',
                    style: TextPrimary.subHeader,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Firur:\n1. Image Picker\n2. Print to PDF',
                    style: TextGrey.thin,
                  )
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
            context.go('/profile');
          },
          child: Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          foregroundColor: Colorz.primary,
        ),
      ),
    );
  }
}
