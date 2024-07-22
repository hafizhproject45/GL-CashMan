import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gl_cashman/core/utils/utility.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../cubit/payment/get_payment/get_payment_cubit.dart';

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

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            '${payment?.length ?? 0}',
                            style: const TextStyle(
                              fontSize: 46,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: Text(
                          'Payment Count',
                          style: AppTextStyle.mediumPrimary,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetPaymentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
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
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              '--',
                              style: AppTextStyle.headingPrimary,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 10,
                          child: Text(
                            'Payment Latest',
                            style: AppTextStyle.mediumPrimary,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final length = payment.length - payment.length;

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Utility.getFirstWordFromString(
                                  payment[length].paymentDate,
                                ),
                                style: AppTextStyle.headingPrimary,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                Utility.getLastWordFromString(
                                  payment[length].paymentDate,
                                ),
                                style: AppTextStyle.mediumPrimary,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        left: 0,
                        bottom: 10,
                        child: Text(
                          'Payment Latest',
                          style: AppTextStyle.mediumPrimary,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetPaymentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
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
