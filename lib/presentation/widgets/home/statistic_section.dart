import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_multi_value_card.dart';
import 'payment_single_value_card.dart';
import '../../../core/utils/utility.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../cubit/payment/get_payment/get_payment_cubit.dart';
import '../global/shimmer/my_shimmer_custom.dart';

class StatisticSection extends StatelessWidget {
  const StatisticSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 15, // spacing between rows
        crossAxisSpacing: 15, // spacing between columns
        childAspectRatio: 1 / 1,
      ),
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: BlocBuilder<GetPaymentCubit, GetPaymentState>(
            builder: (context, state) {
              if (state is GetPaymentLoaded) {
                final List<PaymentEntity>? payment = state.data;

                return PaymentSingleCard(
                  title: 'Payment Count',
                  value: '${payment?.length ?? 0}',
                );
              } else if (state is GetPaymentLoading) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: ShimmerCustomWidget(
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: ShimmerCustomWidget(
                          height: 20,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text(state.message!);
              }
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: BlocBuilder<GetPaymentCubit, GetPaymentState>(
            builder: (context, state) {
              if (state is GetPaymentLoaded) {
                final List<PaymentEntity>? payment = state.data;

                if (payment == null || payment.isEmpty) {
                  return const PaymentSingleCard(
                    title: 'Latest Payment',
                    value: '--',
                  );
                }

                final length = payment.length - payment.length;

                return PaymentMultiValueCard(
                  title: 'Latest Payment',
                  month: Utility.getFirstWordFromString(
                    payment[length].paymentDate!,
                  ),
                  year: Utility.getLastWordFromString(
                    payment[length].paymentDate!,
                  ),
                );
              } else if (state is GetPaymentLoading) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShimmerCustomWidget(
                                height: 20,
                                width: 70,
                              ),
                              SizedBox(height: 5),
                              ShimmerCustomWidget(
                                height: 20,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: ShimmerCustomWidget(
                          height: 20,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text(state.message!);
              }
            },
          ),
        ),
      ],
    );
  }
}
