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
                name: "Data Diri",
                icon: Icons.person_pin_sharp,
                route: 'profile/biodata',
              ),
              ListOfFeaturesWidget(
                name: "Riwayat Pembayaran",
                icon: Icons.account_balance_wallet,
                route: 'profile/history',
              ),
              ListOfFeaturesWidget(
                name: "List Kontak",
                icon: Icons.contact_phone,
                route: 'profile/contact',
              ),
              ListOfFeaturesWidget(
                name: "Pertanyaan & Jawaban",
                icon: Icons.question_answer,
                route: 'profile/question',
              ),
              ListOfFeaturesWidget(
                name: "Catatan Rilis",
                icon: Icons.featured_play_list,
                route: 'profile/release',
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
