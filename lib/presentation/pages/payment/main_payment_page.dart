import 'package:flutter/material.dart';

import '../../widgets/global/button/my_button_widget.dart';
import '../../widgets/global/text_field_auth/text_field_text_widget.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/global/imagePicker_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _dateController = TextEditingController();
  final FocusNode _dateFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _dateController.dispose();
    _dateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning, ',
              style: AppTextStyle.body,
            ),
            SizedBox(height: 3),
            Text(
              'Hafizh Athallah Yovanka',
              style: AppTextStyle.bodyBoldPrimary,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  MyTextFieldText(
                    name: 'Payment date',
                    width: 310,
                    focusNode: _dateFocusNode,
                    controller: _dateController,
                    nameStyle: AppTextStyle.mediumPrimary,
                    iconz: Icons.date_range,
                    iconColor: AppColor.primary,
                    isDate: true,
                  ),
                  const SizedBox(height: 40),
                  const ImagePickerWidget(),
                  const SizedBox(height: 30),
                  MyButtonWidget(
                    label: 'SEND',
                    width: 310,
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   _payment(M_Payment(
                      //     paymentFrom: _paymentFromController.text,
                      //     month: selectedMonth,
                      //     year: selectedYear,
                      //   ));
                      //   if (selectedImage == null) {
                      //     setState(() {
                      //       dangerToast(message: "Masukkan foto!");
                      //       isLoading = false;
                      //     });
                      //   }
                      // }
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _payment(M_Payment paymentModel) async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   final paymentCollection = FirebaseFirestore.instance.collection("payments");

  //   // Mendapatkan email pengguna yang saat ini login
  //   String email = _auth.currentUser!.email.toString();

  //   String id = paymentCollection.doc().id;
  //   String imageUrl = await _payment_controller.getImageUrl();

  //   DateTime dateTimeNow = DateTime.now();
  //   String dateWithTime =
  //       DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);

  //   final newPayment = M_Payment(
  //     id: id,
  //     paymentFrom: paymentModel.paymentFrom,
  //     email: email,
  //     month: paymentModel.month,
  //     year: paymentModel.year,
  //     imageUrl: imageUrl,
  //     createdAt: dateWithTime,
  //   ).toJson();

  //   try {
  //     await _payment_controller.uploadImg();
  //     await paymentCollection.doc(dateWithTime).set(newPayment);

  //     successToast(
  //         message:
  //             "Berhasil mengirimkan pembayaran\n${paymentModel.month} ${paymentModel.year}");
  //   } catch (err) {
  //     dangerToast(message: "Gagal mengirimkan pembayaran!");
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //       _formKey.currentState!.reset();
  //       _paymentFromController.clear();
  //       selectedImage = null;
  //     });
  //   }
  // }

  // Future<void> _refreshData() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));

  //   setState(() {
  //     isLoading = false;
  //     _formKey.currentState!.reset();
  //     _paymentFromController.clear();
  //     selectedImage = null;
  //   });
  // }
}
