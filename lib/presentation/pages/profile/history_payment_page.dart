import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/profile_bg_widget.dart';

class HistoryPaymentPage extends StatelessWidget {
  const HistoryPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          ProfileBackgroundWidget(),
          SizedBox(height: 40),
          Center(
            child: Text('Riwayat Pembayaran', style: AppTextStyle.heading),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
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

  // Stream<List<M_Payment>> _readData() {
  //   final emailAuth = FirebaseAuth.instance.currentUser!.email;

  //   final userCollection = FirebaseFirestore.instance
  //       .collection("payments")
  //       .where('email', isEqualTo: emailAuth);

  //   return userCollection.snapshots().map((querySnapshot) =>
  //       querySnapshot.docs.map((e) => M_Payment.fromSnapshot(e)).toList());
  // }
}
