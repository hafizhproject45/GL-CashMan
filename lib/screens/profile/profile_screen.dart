import 'package:flutter/material.dart';
import 'package:gl_app/widgets/featureList_widget.dart';
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
              ListOfFeaturesWidget(
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
          ),
        ),
      ),
    );
  }
}
