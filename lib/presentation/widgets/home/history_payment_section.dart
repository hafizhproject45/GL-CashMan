import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/text_style.dart';
import '../../../core/utils/utility.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../cubit/payment/get_payment/get_payment_cubit.dart';
import '../global/shimmer/my_shimmer_custom.dart';
import 'payment_card.dart';

class HistoryPaymentSection extends StatelessWidget {
  const HistoryPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Payment History',
            style: AppTextStyle.subHeading,
          ),
        ),
        BlocBuilder<GetPaymentCubit, GetPaymentState>(
          builder: (context, state) {
            if (state is GetPaymentLoaded) {
              final List<PaymentEntity>? payment = state.data;

              if (payment == null || payment.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Payment is empty\n Make a payment to view the history.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.mediumThin,
                  ),
                );
              }

              return BlocBuilder<GetUserCubit, GetUserState>(
                builder: (context, state) {
                  if (state is GetUserLoaded) {
                    final UserEntity? user = state.data;

                    return ListView.builder(
                      padding: const EdgeInsets.all(20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: payment.length,
                      itemBuilder: (context, index) {
                        final data = payment[index];

                        return PaymentCard(
                          date: Utility.removeStrip(data.paymentDate),
                          createdAt: Utility.timeAgoFormat(data.createdAt!),
                          dataPayment: data,
                          dataUser: user!,
                        );
                      },
                    );
                  } else if (state is GetUserLoading) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ShimmerCustomWidget(
                            width: screenWidth * 0.9,
                            height: 70,
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(state.message!),
                    );
                  }
                },
              );
            } else if (state is GetPaymentLoading) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ShimmerCustomWidget(
                      width: screenWidth * 0.9,
                      height: 70,
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(state.message!),
              );
            }
          },
        ),
      ],
    );
  }
}
