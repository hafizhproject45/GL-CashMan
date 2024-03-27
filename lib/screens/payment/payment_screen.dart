import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gl_app/models/M_payment.dart';
import 'package:gl_app/widgets/text_field_normal/text_field_normal_widget.dart';
import 'package:gl_app/widgets/toast.dart';
import 'package:intl/intl.dart';

import '../../widgets/dropdown_widget.dart';
import '../../widgets/imagePicker_widget.dart';
import '../../styles/color_pallete.dart';
import '../../styles/text_styles.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  TextEditingController _paymentFromController = TextEditingController();

  bool isLoading = false;
  bool isSend = false;

  @override
  void dispose() {
    _paymentFromController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String? selectedMonth;
  String? selectedYear;

  final List<String> monthItems = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember ',
  ];

  final List<String> yearItems = [
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Masukkan',
                      style: TextPrimary.thin,
                    ),
                    Text('Bukti Pembayaran', style: TextPrimary.header),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      width: 300,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(height: 20),
                    TextFieldNormalWidget(
                      controller: _paymentFromController,
                      name: "Nama Pembayar",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan Nama Pembayar";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        DropDownWidget(
                          name: "Bulan",
                          items: monthItems,
                          onSaved: (value) {
                            setState(() {
                              selectedMonth = value;
                            });
                          },
                        ),
                        SizedBox(width: 8),
                        DropDownWidget(
                          name: "Tahun",
                          items: yearItems,
                          onSaved: (value) {
                            setState(() {
                              selectedYear = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ImagePickerWidget(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _payment(M_Payment(
                                  paymentFrom: _paymentFromController.text,
                                  month: selectedMonth,
                                  year: selectedYear,
                                ));
                              }
                            },
                      child: isLoading
                          ? Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorz.primary,
                        fixedSize: Size.fromWidth(310),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _payment(M_Payment paymentModel) async {
    setState(() {
      isLoading = true;
    });
    final userCollection = FirebaseFirestore.instance.collection("payments");

    String id = userCollection.doc().id;
    String imageUrl = await _getImageUrl();
    String email = _auth.currentUser!.email.toString();
    DateTime dateTimeNow = DateTime.now();
    String dateWithTime =
        DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);

    final newPayment = M_Payment(
      id: id,
      paymentFrom: paymentModel.paymentFrom,
      email: email,
      month: paymentModel.month,
      year: paymentModel.year,
      imageUrl: imageUrl,
      createdAt: dateWithTime,
    ).toJson();

    try {
      await _uploadImg();
      await userCollection
          .doc(email)
          .collection('payment')
          .doc(dateWithTime)
          .set(newPayment);

      showToast(
          message:
              "Berhasil mengirimkan pembayaran ${paymentModel.month} ${paymentModel.year}");
    } catch (err) {
      showToast(message: "Gagal mengirimkan pembayaran");
    } finally {
      setState(() {
        isLoading = false;
        _formKey.currentState!.reset();
        _paymentFromController.clear();
        selectedImage = null;
      });
    }
  }

  Future<void> _uploadImg() async {
    File? uploadFile = File(selectedImage!.path);

    try {
      await _storage.ref('payments/${uploadFile.path}');
    } catch (err) {}
  }

  Future<String> _getImageUrl() async {
    DateTime dateTimeNow = DateTime.now();
    String dateWithTime =
        DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);
    File? uploadFile = File(selectedImage!.path);

    try {
      // Upload file terlebih dahulu ke Firebase Storage
      final uploadTask = await _storage
          .ref('payments')
          .child('${_auth.currentUser!.email}_payment_${dateWithTime}.jpg')
          .putFile(uploadFile);

      // Dapatkan URL unduhan setelah berhasil mengunggah
      final imageUrl = await uploadTask.ref.getDownloadURL();

      return imageUrl;
    } catch (error) {
      throw error;
    }
  }
}
