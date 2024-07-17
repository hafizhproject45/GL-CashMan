import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../cubit/auth/update_user/update_user_cubit.dart';
import '../../../core/utils/toast.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../global/button/my_button_widget.dart';
import '../global/shimmer/my_shimmer_custom.dart';
import '../global/text_field_auth/text_field_text_widget.dart';

class UpdateUserForm extends StatefulWidget {
  const UpdateUserForm({
    super.key,
  });

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _blockFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    _fullnameFocusNode.dispose();
    _blockFocusNode.dispose();
    _contactFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: BlocBuilder<GetUserCubit, GetUserState>(
        builder: (context, state) {
          if (state is GetUserLoaded) {
            final UserEntity? data = state.data;

            if (data != null) {
              // Set text controllers only if data is not null
              _fullnameController.text = data.fullname;
              _blockController.text = data.block;
              _contactController.text = data.contact;

              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFieldText(
                        name: "Nama Lengkap",
                        iconz: Icons.person,
                        textInputAction: TextInputAction.next,
                        focusNode: _fullnameFocusNode,
                        controller: _fullnameController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nama Lengkap tidak boleh kosong";
                          } else if (value.length > 50) {
                            return "Nama Lengkap terlalu panjang";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      MyTextFieldText(
                        name: "Nomor rumah",
                        iconz: Icons.home_work_rounded,
                        textInputAction: TextInputAction.next,
                        focusNode: _blockFocusNode,
                        controller: _blockController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nomor rumah tidak boleh kosong";
                          } else if (value.length > 5) {
                            return "Nomor rumah tidak valid";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      MyTextFieldText(
                        name: "Nomor Handphone",
                        iconz: Icons.phone_android,
                        textInputAction: TextInputAction.next,
                        type: TextInputType.number,
                        focusNode: _contactFocusNode,
                        controller: _contactController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          String pattern = r'(^[0-9]{10,15}$)';
                          RegExp regExp = RegExp(pattern);

                          if (value!.isEmpty) {
                            return "Kontak tidak boleh kosong";
                          } else if (!regExp.hasMatch(value)) {
                            return "Kontak tidak valid";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<UpdateUserCubit, UpdateUserState>(
                    listener: (context, state) {
                      if (state is UpdateUserFailed) {
                        dangerToast(msg: state.message);
                      } else {
                        Get.offAllNamed('/navbar');
                        successToast(msg: 'Berhasil Update Profil');
                      }
                    },
                    builder: (context, state) {
                      return MyButtonWidget(
                        label: 'SIMPAN',
                        width: screenWidth * 0.9,
                        onPressed: () {
                          if (state is! UpdateUserLoading) {
                            _fullnameFocusNode.unfocus();
                            _contactFocusNode.unfocus();
                            _blockFocusNode.unfocus();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<UpdateUserCubit>().update(
                                    UpdateRequestEntity(
                                      fullname: _fullnameController.text,
                                      block: _blockController.text,
                                      contact: _contactController.text,
                                    ),
                                  );
                            }
                          }
                        },
                        isLoading: state is UpdateUserLoading,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else {
              return const Center(
                child: Text(
                  "User data not found",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
          } else if (state is GetUserLoading) {
            return Column(
              children: [
                const SizedBox(height: 18),
                ShimmerCustomWidget(
                  width: screenWidth * 0.9,
                  height: 40,
                ),
                const SizedBox(height: 18),
                ShimmerCustomWidget(
                  width: screenWidth * 0.9,
                  height: 40,
                ),
                const SizedBox(height: 18),
                ShimmerCustomWidget(
                  width: screenWidth * 0.9,
                  height: 40,
                ),
                const SizedBox(height: 50),
                ShimmerCustomWidget(
                  width: screenWidth * 0.9,
                  height: 50,
                ),
              ],
            );
          } else if (state is GetUserNotLoaded) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Text('Unknown error');
          }
        },
      ),
    );
  }
}
