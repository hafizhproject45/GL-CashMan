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
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 200,
              width: double.infinity,
              child: Image(
                  image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
            ),
            ListOfFeatures(
              name: "Contact",
              icon: Icons.contact_phone,
              route: 'profile/contact',
            ),
            SizedBox(
              height: 200,
            ),
          ],
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
    return Padding(
      padding: EdgeInsets.only(left: 20),
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
                style: ThemeText.thinTextPrimary,
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(PaymentPage.routeName);
                  },
                  child: IconButton(
                    onPressed: () {
                      context.go('/$route');
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: double.infinity,
            height: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
