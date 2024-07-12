import 'package:flutter/material.dart';
import '../../../core/utils/text_style.dart';
import '../global/button/my_button_widget.dart';
import '../global/text_field_auth/text_field_text_widget.dart';

class EditUserForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const EditUserForm({
    required this.formKey,
    super.key,
  });

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _blockFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _fullnameFocusNode.dispose();
    _blockFocusNode.dispose();
    _contactFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Edit Profile',
            style: AppTextStyle.headingWhite,
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: screenWidth * 0.9,
            child: Column(
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
                MyTextFieldText(
                  name: "Email",
                  iconz: Icons.email,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  width: screenWidth * 0.9,
                  validator: (value) {
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);

                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!regex.hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          MyButtonWidget(
            label: 'SIMPAN',
            width: screenWidth * 0.9,
            onPressed: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
