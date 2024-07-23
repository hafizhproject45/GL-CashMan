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
          create: (_) => sl<GetUserCubit>()..getData(),
        ),
        BlocProvider(
          create: (_) => sl<UpdateUserCubit>(),
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                          const Text(
                            'Edit Profile',
                            style: AppTextStyle.headingWhite,
                          ),
                          const Icon(
                            Icons.remove,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: UpdateUserForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
