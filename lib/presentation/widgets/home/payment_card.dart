// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../core/utils/toast.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/utils/utility.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../cubit/payment/delete_payment/delete_payment_cubit.dart';
import '../../cubit/payment/get_payment/get_payment_cubit.dart';
import '../global/button/my_button_widget.dart';
import '../global/my_dialog_confirmation.dart';
import '../global/shimmer/my_shimmer_custom.dart';

class PaymentCard extends StatefulWidget {
  final String date;
  final String createdAt;
  final PaymentEntity dataPayment;
  final UserEntity dataUser;

  const PaymentCard({
    super.key,
    required this.date,
    required this.createdAt,
    required this.dataPayment,
    required this.dataUser,
  });

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
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
      child: ListTile(
        leading: const Icon(
          Icons.history,
          color: AppColor.primary,
        ),
        title: Text(
          widget.date,
          style: AppTextStyle.bodyBoldPrimary,
        ),
        subtitle: Text(
          widget.createdAt,
          style: AppTextStyle.mediumThin,
        ),
        trailing: MyButtonWidget(
          label: 'Details',
          width: 100,
          height: 40,
          onPressed: () {
            Get.dialog(
              Center(
                child: SingleChildScrollView(
                  child: Dialog(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Payment Details',
                                style: AppTextStyle.subHeadingPrimaryBold,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () => Get.close(1),
                                iconSize: 30,
                                color: AppColor.textSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          widget.dataPayment.imageUrl!.isNotEmpty
                              ? InstaImageViewer(
                                  imageUrl: widget.dataPayment.imageUrl!,
                                  backgroundColor: AppColor.textSmall,
                                  disableSwipeToDismiss: true,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColor.textSmall),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(3),
                                      child: Image.network(
                                        widget.dataPayment.imageUrl!,
                                        height: 160,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const ShimmerCustomWidget(
                                            height: 160,
                                            width: 120,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.textSmall),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.network(
                                      Utility.imagePlaceHolder(120, 160),
                                      height: 160,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const ShimmerCustomWidget(
                                          height: 160,
                                          width: 120,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              ContainerOfField(
                                title: 'Payer Name',
                                field: widget.dataUser.fullname,
                              ),
                              const SizedBox(height: 10),
                              ContainerOfField(
                                title: 'Payment For',
                                field: Utility.removeStrip(
                                  widget.dataPayment.paymentDate,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ContainerOfField(
                                title: 'Payment Date',
                                field:
                                    '${Utility.formatDateFromStringToDate(widget.dataPayment.createdAt!)} - ${Utility.formatDateFromStringToHours(widget.dataPayment.createdAt!)} WIB',
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          MyButtonWidget(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => DialogConfirmation(
                                  title: 'DELETE',
                                  text:
                                      'Are you sure\nto delete payment "${Utility.removeStrip(widget.dataPayment.paymentDate)}"?',
                                  onClick: () {
                                    context
                                        .read<DeletePaymentCubit>()
                                        .delete(widget.dataPayment.id!);
                                    Get.close(2);
                                    context.read<GetPaymentCubit>().getData();
                                    successToast(
                                        msg:
                                            'Success delete payment "${Utility.removeStrip(widget.dataPayment.paymentDate)}"');
                                  },
                                ),
                              );
                            },
                            buttonColor: Colors.red,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'DELETE PAYMENT',
                                  style: AppTextStyle.bodyWhite,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContainerOfField extends StatelessWidget {
  const ContainerOfField({
    super.key,
    required this.title,
    required this.field,
  });

  final String title;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.textSmall,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Text(
          title,
          style: AppTextStyle.bodyBoldPrimary,
        ),
        const SizedBox(height: 5),
        Text(
          field,
          style: AppTextStyle.medium,
        ),
      ]),
    );
  }
}
