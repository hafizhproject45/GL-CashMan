import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gl_app/models/M_Payment.dart';
import 'package:gl_app/styles/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/profile_bg_widget.dart';
import '../../styles/color_pallete.dart';

class HistoryPaymentScreen extends StatelessWidget {
  HistoryPaymentScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileBackgroundWidget(),
          SizedBox(height: 40),
          Center(
            child: Text('Riwayat Pembayaran', style: TextPrimary.header),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  StreamBuilder<List<M_Payment>>(
                    stream: _readData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return Center(child: Text("Data tidak ditemukan!"));
                      }
                      final payments = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('No')),
                              DataColumn(label: Text('Pembayaran')),
                              DataColumn(label: Text('Dibayar pada')),
                            ],
                            rows: payments.asMap().entries.map((entry) {
                              int index = entry.key + 1;
                              M_Payment payment = entry.value;
                              return DataRow(
                                cells: [
                                  DataCell(Text(index.toString())),
                                  DataCell(
                                    Row(
                                      children: [
                                        Text(payment.month ?? '-'),
                                        Text(' - '),
                                        Text(payment.year ?? '-')
                                      ],
                                    ),
                                  ),
                                  DataCell(Text(payment.createdAt ?? '-')),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          foregroundColor: Colorz.primary,
        ),
      ),
    );
  }

  Stream<List<M_Payment>> _readData() {
    final emailAuth = FirebaseAuth.instance.currentUser!.email;

    final userCollection = FirebaseFirestore.instance
        .collection("payments")
        .where('email', isEqualTo: emailAuth);

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => M_Payment.fromSnapshot(e)).toList());
  }
}
