import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/faq/faq_entity.dart';
import '../../cubit/faq/get_faq_cubit.dart';
import '../../../core/utils/text_style.dart';
import '../../../injection_container.dart';
import '../../widgets/global/shimmer/my_shimmer_custom.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/profile/profile_bg_section.dart';
import '../../widgets/profile/question_container_widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final faqCubit = sl<GetFaqCubit>();

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<GetUserCubit>()..getData(),
        ),
        BlocProvider(
          create: (_) => faqCubit..getData(),
        ),
      ],
      child: _content(),
    );
  }

  Widget _content() {
    return Scaffold(
      body: SmartRefresher(
        onRefresh: () => _onRefresh(context),
        controller: _refreshController,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const ProfileBgSection(),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Frequently Asked Questions',
                  style: AppTextStyle.headingPrimary,
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<GetFaqCubit, GetFaqState>(
                builder: (context, state) {
                  if (state is GetFaqLoaded) {
                    final List<FaqEntity>? faq = state.data;
                    if (faq == null || faq.isEmpty) {
                      return const Center(
                        child: Text(
                          'FAQ not Found',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.mediumThin,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: faq.length,
                      itemBuilder: (context, index) {
                        final data = faq[index];
                        return QuestionContainerWidget(
                          question: data.question ?? '',
                          answer: data.answer ?? '',
                        );
                      },
                    );
                  } else if (state is GetFaqLoading) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ShimmerCustomWidget(
                            height: 100,
                            width: double.infinity,
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text(state.message!));
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  void _onRefresh(BuildContext context) {
    faqCubit.getData();
    _refreshController.refreshCompleted();
  }
}
