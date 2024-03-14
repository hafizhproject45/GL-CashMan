import 'package:flutter/material.dart';
import 'package:gl_app/utils/color_pallete.dart';
import 'package:gl_app/utils/text_styles.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 200,
                width: double.infinity,
                child: Image(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover),
              ),
              ListOfFeatures(
                name: "List Kontak",
                icon: Icons.contact_phone,
                route: 'profile/contact',
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
            onPressed: () {
              context.go('/');
            },
            backgroundColor: Colors.red,
            child: Icon(
              Icons.logout,
              color: Colors.white,
            )),
      ),
    );
  }
}

class ListOfFeatures extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;

  ListOfFeatures({
    required this.name,
    required this.icon,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/$route'),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: ColorPallete.primaryColor,
                ),
                Text(
                  name,
                  style: TextPrimary.thin,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorPallete.primaryColor,
                  size: 24,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
