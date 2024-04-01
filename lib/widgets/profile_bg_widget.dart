import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gl_app/models/M_User.dart';
import 'package:gl_app/styles/color_pallete.dart';
import 'package:gl_app/widgets/text_field_auth/text_field_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../widgets/toast.dart';

class ProfileBackgroundWidget extends StatefulWidget {
  const ProfileBackgroundWidget({
    super.key,
  });

  @override
  State<ProfileBackgroundWidget> createState() =>
      _ProfileBackgroundWidgetState();
}

class _ProfileBackgroundWidgetState extends State<ProfileBackgroundWidget> {
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 250,
          width: screenWidth,
          child: Image(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SizedBox(height: 60),
            Container(
              width: 370,
              child: Column(
                children: [
                  Text(
                    'Hallo,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.email!.split('@')[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Colors.white,
                        title: Text(
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
                                SizedBox(height: 20),
                                TextFieldTextWidget(
                                  iconz: Icons.person_pin_sharp,
                                  name: "Nama Lengkap",
                                  controller: _fullnameController,
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return "Masukkan Nama Lengkap";
                                    }
                                    return null;
                                  },
                                ),
                                TextFieldTextWidget(
                                  iconz: Icons.home_work_rounded,
                                  name: "Blok",
                                  controller: _blockController,
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return "Masukkan Nomor rumah";
                                    } else if (value.length > 5) {
                                      return "Blok tidak valid";
                                    }
                                    return null;
                                  },
                                ),
                                TextFieldTextWidget(
                                  iconz: Icons.phone_android,
                                  name: "Nomor Handphone",
                                  controller: _contactController,
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return "Masukkan Nomor Handphone";
                                    } else if (value.length > 15) {
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
                            child: Text('Batal'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colorz.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _updateData(M_User(
                                          fullname: _fullnameController.text,
                                          block: _blockController.text,
                                          contact: _contactController.text));
                                    }
                                  },
                            child: _isLoading
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                : Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Row(
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
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    context.go('/');
                    successToast(message: "Berhasil Logout");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .get();
      if (userDoc.exists) {
        final userData = M_User.fromSnapshot(userDoc);
        _fullnameController.text = userData.fullname ?? '';
        _blockController.text = userData.block ?? '';
        _contactController.text = userData.contact ?? '';
      }
    }
  }

  void _updateData(M_User userModel) async {
    setState(() {
      _isLoading = true;
    });

    final _auth = FirebaseAuth.instance.currentUser!;
    final userCollection = FirebaseFirestore.instance.collection("users");
    final email = _auth.email;

    DateTime dateTimeNow = DateTime.now();
    String dateWithTime =
        DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);

    final userDoc = await userCollection.doc(email).get();

    if (userDoc.exists) {
      final previousUserData = await M_User.fromSnapshot(userDoc);

      final currenCreatedAt = await previousUserData.createdAt;
      final currentId = await previousUserData.id;

      final newData = M_User(
        id: currentId,
        email: email,
        fullname: userModel.fullname,
        block: userModel.block,
        contact: userModel.contact,
        createdAt: currenCreatedAt,
        updateAt: dateWithTime,
      ).toJson();

      try {
        await userCollection.doc(email).update(newData);
        successToast(message: "Berhasil update user");
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context, rootNavigator: true).pop();
      } catch (error) {
        dangerToast(message: "Gagal update user");
      }
    }
  }
}
