// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:gl_cashman/core/utils/text_style.dart';
// import 'package:gl_cashman/presentation/cubit/auth/get_user/get_user_cubit.dart';
// import 'package:gl_cashman/presentation/widgets/global/button/my_button_widget.dart';
// import 'package:insta_image_viewer/insta_image_viewer.dart';

// import '../../../core/utils/colors.dart';
// import '../../../domain/entities/payment/payment_entity.dart';
// import '../../../injection_container.dart';
// import '../../widgets/global/shimmer/my_shimmer_custom.dart';

// class HistoryPaymentDetail extends StatefulWidget {
//   const HistoryPaymentDetail({super.key});

//   @override
//   State<HistoryPaymentDetail> createState() => _HistoryPaymentDetailState();
// }

// class _HistoryPaymentDetailState extends State<HistoryPaymentDetail> {
//   final PaymentEntity data = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<GetUserCubit>()..getData(),
//       child: _content(),
//     );
//   }

//   Widget _content() {
//     return Scaffold(
//       body: Align(
//         alignment: Alignment.center,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: 
//         ),
//       ),
//     );
//   }
// }
