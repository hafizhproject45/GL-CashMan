import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gl_cashman/presentation/cubit/payment/delete_payment/delete_payment_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../injection_container.dart';
import '../../cubit/payment/get_payment/get_payment_cubit.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/global/my_app_bar.dart';
import '../../widgets/home/history_payment_section.dart';
import '../../widgets/home/statistic_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userCubit = sl<GetUserCubit>();
  final getPaymentCubit = sl<GetPaymentCubit>();

  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => userCubit..getData(),
        ),
        BlocProvider(
          create: (_) => getPaymentCubit..getData(),
        ),
        BlocProvider(
          create: (_) => sl<DeletePaymentCubit>(),
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
        child: const SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SizedBox(height: 30),
              //? STATISTIC SECTION
              StatisticSection(),
              SizedBox(height: 30),
              //? HISTORY PAYMENT SECTION
              HistoryPaymentSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh(BuildContext context) {
    userCubit.getData();
    getPaymentCubit.getData();
    _refreshController.refreshCompleted();
  }
}
