import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../widgets/imagePicker_widget.dart';

class C_Payment {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> uploadImg() async {
    File? uploadFile = File(selectedImage!.path);

    try {
      await _storage.ref('payments/${uploadFile.path}');
    } catch (err) {}
  }

  Future<String> getImageUrl() async {
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
