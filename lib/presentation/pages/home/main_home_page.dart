import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../../core/utils/colors.dart';
import '../../../injection_container.dart';
import '../../widgets/global/button/my_button_widget.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/global/my_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetUserCubit>()..getData(),
      child: _content(),
    );
  }

  Widget _content() {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            GridView(
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
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 46,
                                color: AppColor.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
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
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              'September',
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Payment History',
                style: AppTextStyle.bodyBold,
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
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
                        "${mont[index]} '24",
                        style: AppTextStyle.subHeadingPrimary,
                      ),
                      subtitle: Text(
                        '1 ${mont[index]} 2024',
                        style: AppTextStyle.mediumThin,
                      ),
                      trailing: MyButtonWidget(
                        label: 'Detail',
                        width: 90,
                        height: 40,
                        onPressed: () {},
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<String> mont = [
    'September',
    'August',
    'Juli',
  ];
}
