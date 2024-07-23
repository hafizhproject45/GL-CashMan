// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utils/utility.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/constants.dart';
import '../../../presentation/widgets/global/imagePicker_widget.dart';
import '../../models/payment/payment_model.dart';

abstract class PaymentDatasource {
  Future<TaskSnapshot> uploadImage(String email);
  Future<void> payment(PaymentEntity request);
  Future<String> getImageUrl(String email, {bool getImageUrl = true});
  Future<List<PaymentEntity>> getPayment(int userId);
  Future<void> deletePayment(
    int paymentId,
    // String imageUrl,
  );
}

class PaymentDatasourceImpl extends PaymentDatasource {
  final FirebaseStorage storage;
  final SupabaseClient supabase;

  PaymentDatasourceImpl({
    required this.storage,
    required this.supabase,
  });

  @override
  Future<TaskSnapshot> uploadImage(String email) async {
    try {
      File? uploadFile = File(selectedImage!.path);
      final date = Utility.formatDatePostApi(DateTime.now());

      final uploadTask = await storage
          .ref('payments')
          .child('${email}_$date.jpg')
          .putFile(uploadFile);
      return uploadTask;
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<String> getImageUrl(String email, {bool getImageUrl = true}) async {
    try {
      final image = await uploadImage(email);

      if (getImageUrl) {
        // result = https://firebasestorage.googleapis.com/v0/b/gl-cashman.appspot.com...
        final imageUrl = await image.ref.getDownloadURL();
        return imageUrl;
      } else {
        // result = payments/hafizhathallah45@gmail.com_2024-07-22 15:40:47
        final imageName = image.ref.fullPath;
        return imageName;
      }
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<void> payment(PaymentEntity request) async {
    try {
      await supabase.from('payments').insert(request.toJson());
    } catch (e) {
      return _handleException(e);
    } finally {
      selectedImage = null;
    }
  }

  @override
  Future<List<PaymentEntity>> getPayment(int userId) async {
    try {
      final res = await supabase
          .from('payments')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return res.map((x) => PaymentModel.fromJson(x)).toList();
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<void> deletePayment(
    int paymentId,
    // String imageUrl,
  ) async {
    try {
      await supabase.from('payments').delete().eq('id', paymentId);

      // Delete the image from Firebase Storage
      // await storage.ref().child(imageUrl).delete();
    } catch (e) {
      return _handleException(e);
    }
  }

  _handleException(Object e) {
    if (e is ServerException) {
      throw ServerFailure(message: e.message);
    } else if (e is FirebaseException) {
      throw ServerFailure(message: e.message);
    } else {
      throw const UnknownFailure(message: FAILURE_UNKNOWN);
    }
  }
}
