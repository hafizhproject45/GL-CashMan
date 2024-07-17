import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import 'shimmer/my_shimmer_custom.dart';

import '../../../core/utils/text_style.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome back, ',
            style: AppTextStyle.body,
          ),
          const SizedBox(height: 3),
          BlocBuilder<GetUserCubit, GetUserState>(
            builder: (context, state) {
              if (state is GetUserLoaded) {
                final UserEntity? data = state.data;

                if (data == null) {
                  return const Text('Unknow user');
                }

                return Text(
                  data.fullname,
                  style: AppTextStyle.bodyBoldPrimary,
                );
              } else if (state is GetUserLoading) {
                return const ShimmerCustomWidget(
                  width: 150,
                  height: 20,
                );
              } else {
                return Text(state.message!);
              }
            },
          ),
        ],
      ),
    );
  }
}
