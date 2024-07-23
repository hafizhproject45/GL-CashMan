import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/payment/payment_repository.dart';

class UploadImageUsecase implements UseCase<TaskSnapshot, NoParams> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  UploadImageUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, TaskSnapshot>> call(NoParams params) async {
    final getId = await authRepository.getUserID();

    late int userID;

    getId.fold(
      (l) => l,
      (r) => userID = r,
    );

    final getEmail = await authRepository.getRemoteUserData(userID);

    late String userEmail;

    getEmail.fold(
      (l) => l,
      (r) => userEmail = r.email,
    );

    final result = await paymentRepository.uploadImage(userEmail);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
