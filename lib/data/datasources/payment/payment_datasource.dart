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
  Future<void> payment(PaymentEntity request, String email);
  Future<PaymentEntity> getPayment(int paymentId);
  Future<List<PaymentEntity>> getPaymentByUserId(int userId);
  Future<void> deletePayment(int paymentId, String imageName);
}

class PaymentDatasourceImpl extends PaymentDatasource {
  final FirebaseStorage storage;
  final SupabaseClient supabase;

  PaymentDatasourceImpl({
    required this.storage,
    required this.supabase,
  });

  @override
  Future<void> payment(PaymentEntity request, String email) async {
    try {
      File? uploadFile = File(selectedImage!.path);
      final date = Utility.formatDatePostApi(DateTime.now());

      final uploadTask = await storage
          .ref('payments')
          .child('${email}_$date.jpg')
          .putFile(uploadFile);

      final imageUrl = await uploadTask.ref.getDownloadURL();
      final imageName = uploadTask.ref.fullPath.split('/')[1];

      await supabase.from('payments').insert(
            PaymentEntity(
              userId: request.userId,
              imageUrl: imageUrl,
              imageName: imageName,
              paymentDate: request.paymentDate,
              createdAt: request.createdAt,
              updatedAt: request.updatedAt,
            ),
          );
    } catch (e) {
      return _handleException(e);
    } finally {
      selectedImage = null;
    }
  }

  @override
  Future<PaymentEntity> getPayment(int paymentId) async {
    try {
      final res =
          await supabase.from('payments').select().eq('id', paymentId).single();

      return PaymentModel.fromJson(res);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<List<PaymentEntity>> getPaymentByUserId(int userId) async {
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
  Future<void> deletePayment(int paymentId, String imageName) async {
    try {
      await supabase.from('payments').delete().eq('id', paymentId);

      // Delete the image from Firebase Storage
      await storage.ref('payments').child(imageName).delete();
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
