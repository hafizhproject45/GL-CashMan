import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/utils/text_style.dart';
import '../../../domain/entities/contact/contact_entity.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../cubit/contact/get_contact_cubit.dart';
import '../../widgets/global/shimmer/my_shimmer_custom.dart';
import '../../widgets/profile/contactList_widget.dart';
import '../../widgets/profile/profile_bg_section.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final userCubit = sl<GetUserCubit>();
  final contactCubit = sl<GetContactCubit>();

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => userCubit..getData(),
        ),
        BlocProvider(
          create: (_) => contactCubit..getData(),
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
          child: Column(
            children: [
              const ProfileBgSection(),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Contact List',
                  style: AppTextStyle.headingPrimary,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const PhoneListWidget(
                      name: "ADMIN",
                      phoneNumber: "+6285175435207",
                    ),
                    const SizedBox(height: 30),
                    const Center(
                        child:
                            Text('Pengurus RT 08', style: AppTextStyle.body)),
                    const SizedBox(height: 20),
                    BlocBuilder<GetContactCubit, GetContactState>(
                      builder: (context, state) {
                        if (state is GetContactLoaded) {
                          final List<ContactEntity>? contacts = state.data;

                          if (contacts == null || contacts.isEmpty) {
                            return const Center(
                              child: Text(
                                'Phone not Found',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.mediumThin,
                              ),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: contacts.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final contact = contacts[index];

                              return PhoneListWidget(
                                name: contact.name!,
                                phoneNumber: contact.phone!,
                              );
                            },
                          );
                        } else if (state is GetContactLoading) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: ShimmerCustomWidget(
                                  height: 60,
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
                  ],
                ),
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
    userCubit.getData();
    contactCubit.getData();
    _refreshController.refreshCompleted();
  }
}
