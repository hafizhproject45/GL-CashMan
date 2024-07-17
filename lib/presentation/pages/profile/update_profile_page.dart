import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';
import '../../../core/utils/text_style.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../cubit/auth/update_user/update_user_cubit.dart';
import '../../widgets/global/my_background_image.dart';
import '../../widgets/profile/update_user_form.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetUserCubit>()..getData(),
        ),
        BlocProvider(
          create: (context) => sl<UpdateUserCubit>(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: MyBackgroundImage(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  AppImages.bg,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Edit Profile',
                      style: AppTextStyle.headingWhite,
                    ),
                    SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: UpdateUserForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: FloatingActionButton(
              onPressed: () {
                Get.back();
              },
              backgroundColor: Colors.white,
              foregroundColor: AppColor.primary,
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ),
    );
  }
}
