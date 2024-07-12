import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../entities/auth/register_request_entity.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class RegisterUsecase implements UseCase<void, RegisterRequestEntity> {
  final AuthRepository authRepository;

  RegisterUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterRequestEntity params) async {
    final paymentCollection = FirebaseFirestore.instance.collection("users");

    String id = paymentCollection.doc().id;

    final RegisterRequestEntity registerRequest = RegisterRequestEntity(
      id: id,
      fullname: params.fullname,
      block: params.block,
      email: params.email,
      contact: params.contact,
      password: params.password,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    Either<Failure, void> result =
        await authRepository.register(registerRequest);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
