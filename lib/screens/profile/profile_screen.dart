import 'package:flutter/material.dart';

import '../../widgets/profile_bg_widget.dart';
import '../../widgets/featureList_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ProfileBackgroundWidget(),
              ListOfFeaturesWidget(
                name: "Catatan Rilis",
                icon: Icons.numbers,
                route: 'profile/release',
              ),
              ListOfFeaturesWidget(
                name: "List Kontak Pengurus RT",
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
    );
  }
}
