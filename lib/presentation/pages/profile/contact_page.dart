import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/contactList_widget.dart';
import '../../widgets/profile_bg_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          const ProfileBackgroundWidget(),
          const SizedBox(height: 40),
          const Center(child: Text('List Kontak', style: AppTextStyle.heading)),
          Expanded(
            child: SizedBox(
              width: screenWidth * 0.7,
              child: ListView(
                children: const [
                  ContactListWidget(
                    name: "ADMIN",
                    contactNumber: "+6285175435207",
                  ),
                  SizedBox(height: 30),
                  Center(
                      child: Text('Pengurus RT 08', style: AppTextStyle.body)),
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
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
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
