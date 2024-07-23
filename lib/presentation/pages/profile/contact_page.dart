import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/text_style.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/profile/contactList_widget.dart';
import '../../widgets/profile/profile_bg_section.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetUserCubit>()..getData(),
      child: _content(),
    );
  }

  Widget _content() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileBgSection(),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Contact List',
                style: AppTextStyle.headingPrimary,
              ),
            ),
            const SizedBox(height: 30),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
