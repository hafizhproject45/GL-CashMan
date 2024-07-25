// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/payment/payment_entity.dart';
import '../../cubit/payment/payment/payment_cubit.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/utils/toast.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/global/button/my_button_widget.dart';
import '../../widgets/global/imagePicker_widget.dart';
import '../../widgets/global/my_app_bar.dart';
import '../../widgets/global/text_field_normal/text_field_normal_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final getUserCubit = sl<GetUserCubit>();

  final TextEditingController _dateController = TextEditingController();
  final FocusNode _dateFocusNode = FocusNode();

  final RefreshController _refreshController = RefreshController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _dateController.dispose();
    _dateFocusNode.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getUserCubit..getData(),
        ),
        BlocProvider(
          create: (_) => sl<PaymentCubit>(),
        ),
      ],
      child: _content(),
    );
  }

  Widget _content() {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SmartRefresher(
        onRefresh: () => _onRefresh(context),
        controller: _refreshController,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextFieldNormalWidget(
                      name: 'Payment for',
                      width: 310,
                      focusNode: _dateFocusNode,
                      controller: _dateController,
                      nameStyle: AppTextStyle.mediumPrimary,
                      iconz: Icons.date_range,
                      iconColor: AppColor.primary,
                      isDate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Payment for is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    const ImagePickerWidget(),
                    const SizedBox(height: 30),
                    BlocConsumer<PaymentCubit, PaymentState>(
                      listener: (context, state) {
                        if (state is PaymentFailed) {
                          dangerToast(msg: state.message);
                        } else if (state is PaymentSuccess) {
                          Get.offAllNamed('/navbar');
                          successToast(msg: 'Upload completed successfully');
                        }
                      },
                      builder: (context, state) {
                        return MyButtonWidget(
                          label: 'SEND',
                          width: 310,
                          onPressed: () async {
                            if (state is! PaymentLoading) {
                              _dateFocusNode.unfocus();
                              if (_formKey.currentState!.validate()) {
                                if (selectedImage == null) {
                                  return dangerToast(
                                    msg: "Insert a photo first!",
                                  );
                                }
                                await context.read<PaymentCubit>().payment(
                                      PaymentEntity(
                                        paymentDate: _dateController.text,
                                      ),
                                    );
                              }
                            }
                          },
                          isLoading: state is PaymentLoading,
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh(BuildContext context) {
    getUserCubit.getData();
    _refreshController.refreshCompleted();
  }
}
