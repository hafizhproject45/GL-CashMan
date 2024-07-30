import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import '../../../core/utils/utility.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../cubit/auth/update_user/update_user_cubit.dart';
import '../../../core/utils/toast.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../global/button/my_button_widget.dart';
import '../global/shimmer/my_shimmer_custom.dart';
import '../global/text_field_auth/text_field_text_widget.dart';
import '../global/text_field_normal/text_field_normal_widget.dart';

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
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _blockFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _phoneController.dispose();
    _fullnameFocusNode.dispose();
    _blockFocusNode.dispose();
    _phoneFocusNode.dispose();
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
              _phoneController.text = data.phone;

              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFieldText(
                        name: "Fullname",
                        iconz: Icons.person,
                        textInputAction: TextInputAction.next,
                        type: TextInputType.name,
                        focusNode: _fullnameFocusNode,
                        controller: _fullnameController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Fullname is required";
                          } else if (value.length > 50) {
                            return "Fullname to long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      MyTextFieldNormal(
                        name: "Block",
                        iconz: Icons.home_work_rounded,
                        type: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _blockFocusNode,
                        isBlock: true,
                        textwhite: true,
                        controller: _blockController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Block is required";
                          } else if (value.length > 5) {
                            return "Block doesn't valid";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      MyTextFieldText(
                        name: "Phone",
                        iconz: Icons.phone_android,
                        textInputAction: TextInputAction.next,
                        type: TextInputType.phone,
                        focusNode: _phoneFocusNode,
                        controller: _phoneController,
                        width: screenWidth * 0.9,
                        validator: (value) {
                          String pattern = r'(^[0-9]{10,15}$)';
                          RegExp regExp = RegExp(pattern);

                          if (value!.isEmpty) {
                            return "Phone is required";
                          } else if (!regExp.hasMatch(value)) {
                            return "Phone doesn't valid";
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
                            _phoneFocusNode.unfocus();
                            _blockFocusNode.unfocus();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<UpdateUserCubit>().update(
                                    UpdateRequestEntity(
                                      fullname: _fullnameController.text,
                                      block: _blockController.text,
                                      phone: Utility.convertPhone(
                                          _phoneController.text),
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
