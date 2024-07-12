import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/global/my_background_image.dart';
import '../../widgets/profile/edit_user_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final userDataCubit = sl<GetUserCubit>();

  final RefreshController _refreshController = RefreshController();

  final formKey = GlobalKey<FormState>();

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
          create: (context) => userDataCubit..getData(),
        ),
      ],
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return SafeArea(
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
            SmartRefresher(
              controller: _refreshController,
              onRefresh: () => _onRefresh(context),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //? Form TextField
                    EditUserForm(
                      formKey: formKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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
    );
  }

  void _onRefresh(BuildContext context) {
    userDataCubit.getData();
    _refreshController.refreshCompleted();
  }
}
