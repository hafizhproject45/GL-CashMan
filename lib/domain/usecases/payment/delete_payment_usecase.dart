import 'package:dartz/dartz.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/payment/payment_repository.dart';

class DeletePaymentUsecase implements UseCase<void, int> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  DeletePaymentUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(int params) async {
    final getimageName = await paymentRepository.getPayment(params);

    late String imageName;

    getimageName.fold(
      (l) => Left(l),
      (r) => Right(imageName = r.imageName!),
    );

    final result = await paymentRepository.deletePayment(
      params,
      imageName,
    );
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
