import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/profile/contactList_widget.dart';
import '../../widgets/profile/profile_bg_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileBgSection(),
          const SizedBox(height: 20),
          const Center(
              child: Text('Contact List', style: AppTextStyle.heading)),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: const [
                ContactListWidget(
                  name: "ADMIN",
                  contactNumber: "+6285175435207",
                ),
                SizedBox(height: 30),
                Center(child: Text('Pengurus RT 08', style: AppTextStyle.body)),
                SizedBox(height: 20),
                ContactListWidget(
                  name: "Bpk. Winoto (Ketua)",
                  contactNumber: "+6281573245878",
                ),
                ContactListWidget(
                  name: "Bpk. Hendar (Sekertaris)",
                  contactNumber: "+6282240244333",
                ),
                ContactListWidget(
                  name: "Bpk. Andry (Bendahara)",
                  contactNumber: "+6281394711055",
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          backgroundColor: Colors.white,
          foregroundColor: AppColor.primary,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
