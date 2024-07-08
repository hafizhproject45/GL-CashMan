import 'package:flutter/material.dart';

import '../../widgets/featureList_widget.dart';
import '../../widgets/profile_bg_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
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
    );
  }
}
