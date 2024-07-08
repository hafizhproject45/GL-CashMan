import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/profile_bg_widget.dart';
import '../../widgets/text_field_auth/text_field_text_widget.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileBackgroundWidget(),
          const SizedBox(height: 40),
          const Center(child: Text('Data Diri', style: AppTextStyle.heading)),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          const Text(
                            'Nama Lengkap',
                            style: AppTextStyle.medium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'user.fullname!',
                              style: AppTextStyle.body,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          const Text(
                            'Blok',
                            style: AppTextStyle.medium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'user.block!',
                              style: AppTextStyle.body,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          const Text(
                            'Email',
                            style: AppTextStyle.medium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'user.email!',
                              style: AppTextStyle.body,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          const Text(
                            'Nomor Handhphone',
                            style: AppTextStyle.medium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              'user.contact!',
                              style: AppTextStyle.body,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 40),
                      const Column(
                        children: [
                          Text(
                            'Dibuat pada:',
                            style: AppTextStyle.medium,
                          ),
                          Text(
                            'user.createdAt!',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Diupdate pada:',
                            style: AppTextStyle.medium,
                          ),
                          Text(
                            'user.updateAt!',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              backgroundColor: Colors.white,
                              title: const Text(
                                'Edit User',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              content: Form(
                                key: _formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 20),
                                      TextFieldTextWidget(
                                        iconz: Icons.person_pin_sharp,
                                        name: "Nama Lengkap",
                                        controller: _fullnameController,
                                        validator: (value) {
                                          String pattern = r'(^[a-zA-Z\s]*$)';
                                          RegExp regExp = RegExp(pattern);
                                          if (value!.isEmpty) {
                                            return "Nama Lengkap tidak boleh kosong";
                                          } else if (!regExp.hasMatch(value)) {
                                            return "Nama Lengkap tidak boleh berisi angka";
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFieldTextWidget(
                                        iconz: Icons.home_work_rounded,
                                        name: "Blok",
                                        controller: _blockController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Nomor rumah tidak boleh kosong";
                                          } else if (value.length > 5) {
                                            return "Nomor rumah tidak valid";
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFieldTextWidget(
                                        iconz: Icons.phone_android,
                                        name: "Nomor Handphone",
                                        controller: _contactController,
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
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Batal'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                  onPressed: () {
                                    // if (_formKey.currentState!
                                    //     .validate()) {
                                    //   _formKey.currentState!.save();
                                    //   _updateData(M_User(
                                    //       fullname:
                                    //           _fullnameController.text,
                                    //       block: _blockController.text,
                                    //       contact:
                                    //           _contactController.text));
                                    // }
                                  },
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Edit user',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          backgroundColor: Colors.white,
          foregroundColor: AppColor.primary,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }

  // Stream<List<M_User>> _readData() {
  //   final emailAuth = FirebaseAuth.instance.currentUser!.email;

  //   final userCollection = FirebaseFirestore.instance
  //       .collection("users")
  //       .where('email', isEqualTo: emailAuth);

  //   return userCollection.snapshots().map((querySnapshot) =>
  //       querySnapshot.docs.map((e) => M_User.fromSnapshot(e)).toList());
  // }

  // void _updateData(M_User userModel) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   final emailAuth = FirebaseAuth.instance.currentUser!;
  //   final userCollection = FirebaseFirestore.instance.collection("users");
  //   final email = emailAuth.email;

  //   DateTime dateTimeNow = DateTime.now();
  //   String dateWithTime =
  //       DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);

  //   final userDoc = await userCollection.doc(email).get();

  //   if (userDoc.exists) {
  //     final previousUserData = await M_User.fromSnapshot(userDoc);

  //     final currenCreatedAt = await previousUserData.createdAt;
  //     final currentId = await previousUserData.id;

  //     final newData = M_User(
  //       id: currentId,
  //       email: email,
  //       fullname: userModel.fullname,
  //       block: userModel.block,
  //       contact: userModel.contact,
  //       createdAt: currenCreatedAt,
  //       updateAt: dateWithTime,
  //     ).toJson();

  //     try {
  //       Navigator.of(context, rootNavigator: true).pop();
  //       await userCollection.doc(email).update(newData);
  //       successToast(message: "Berhasil update user");
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     } catch (error) {
  //       dangerToast(message: "Gagal update user");
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUserData();
  // }

  // void _fetchUserData() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     final userDoc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.email)
  //         .get();
  //     if (userDoc.exists) {
  //       final userData = M_User.fromSnapshot(userDoc);
  //       _fullnameController.text = userData.fullname ?? '';
  //       _blockController.text = userData.block ?? '';
  //       _contactController.text = userData.contact ?? '';
  //     }
  //   }
  // }
}
