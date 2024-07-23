import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../global/shimmer/my_shimmer_custom.dart';

import '../../../core/utils/images.dart';
import '../../../core/utils/text_style.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../global/button/my_button_widget.dart';

class ProfileBgSection extends StatefulWidget {
  const ProfileBgSection({
    super.key,
  });

  @override
  State<ProfileBgSection> createState() => _ProfileBgSectionState();
}

class _ProfileBgSectionState extends State<ProfileBgSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 250,
          width: screenWidth,
          child: const Image(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: 370,
              child: Column(
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  BlocBuilder<GetUserCubit, GetUserState>(
                    builder: (context, state) {
                      if (state is GetUserLoaded) {
                        final UserEntity? data = state.data;

                        if (data == null) {
                          return const Center(
                            child: Text('Unknown User'),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            data.fullname,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      } else if (state is GetUserLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: ShimmerCustomWidget(
                            width: 200,
                            height: 40,
                          ),
                        );
                      } else {
                        return Text(state.message!);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyButtonWidget(
              height: 45,
              width: 170,
              borderRadius: 10,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Edit Profile',
                    style: AppTextStyle.bodyWhite,
                  ),
                ],
              ),
              onPressed: () => Get.toNamed('/profile/edit-profile'),
            )
          ],
        )
      ],
    );
  }
}
