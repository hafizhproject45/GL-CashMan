import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gl_app/models/M_User.dart';
import 'package:gl_app/widgets/text_field_auth/text_field_text_widget.dart';
import 'package:gl_app/widgets/toast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../styles/text_styles.dart';
import '../../widgets/profile_bg_widget.dart';
import '../../styles/color_pallete.dart';

class BiodataScreen extends StatefulWidget {
  BiodataScreen({
    Key? key,
  });

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  bool _isLoading = false;
  final emailAuth = FirebaseAuth.instance.currentUser!.email;

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
    return Scaffold(
      body: Column(
        children: [
          ProfileBackgroundWidget(),
          SizedBox(height: 40),
          Center(child: Text('List Kontak', style: TextPrimary.header)),
          Expanded(
            child: StreamBuilder<List<M_User>>(
                stream: _readData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(child: Text("No Data Yet"));
                  }
                  final user = snapshot.data!
                      .firstWhere((user) => user.email == emailAuth);

                  return SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 30),
                            Column(
                              children: [
                                Text(
                                  'Nama Lengkap',
                                  style: TextBlack.thin,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    user.fullname!,
                                    style: TextBlack.body,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                  'Blok',
                                  style: TextBlack.thin,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    user.block!,
                                    style: TextBlack.body,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                  'Email',
                                  style: TextBlack.thin,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    user.email!,
                                    style: TextBlack.body,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                  'Nomor Handhphone',
                                  style: TextBlack.thin,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    user.contact!,
                                    style: TextBlack.body,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 40),
                            Column(
                              children: [
                                Text(
                                  'Dibuat pada:',
                                  style: TextBlack.thin,
                                ),
                                Text(
                                  user.createdAt!,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Diupdate pada:',
                                  style: TextBlack.thin,
                                ),
                                Text(
                                  user.updateAt!,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Edit User',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                                String pattern =
                                                    r'(^[a-zA-Z\s]*$)';
                                                RegExp regExp =
                                                    new RegExp(pattern);
                                                if (value!.isEmpty) {
                                                  return "Nama Lengkap tidak boleh kosong";
                                                } else if (!regExp
                                                    .hasMatch(value)) {
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
                                                String pattern =
                                                    r'(^[0-9]{10,15}$)';
                                                RegExp regExp =
                                                    new RegExp(pattern);

                                                if (value!.isEmpty) {
                                                  return "Kontak tidak boleh kosong";
                                                } else if (!regExp
                                                    .hasMatch(value)) {
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                        onPressed: _isLoading
                                            ? null
                                            : () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _formKey.currentState!.save();
                                                  _updateData(M_User(
                                                      fullname:
                                                          _fullnameController
                                                              .text,
                                                      block:
                                                          _blockController.text,
                                                      contact:
                                                          _contactController
                                                              .text));
                                                }
                                              },
                                        child: _isLoading
                                            ? Container(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(Colors.white),
                                                ),
                                              )
                                            : Text(
                                                'Edit',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          foregroundColor: Colorz.primary,
        ),
      ),
    );
  }

  Stream<List<M_User>> _readData() {
    final emailAuth = FirebaseAuth.instance.currentUser!.email;

    final userCollection = FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: emailAuth);

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => M_User.fromSnapshot(e)).toList());
  }

  void _updateData(M_User userModel) async {
    setState(() {
      _isLoading = true;
    });

    final emailAuth = FirebaseAuth.instance.currentUser!;
    final userCollection = FirebaseFirestore.instance.collection("users");
    final email = emailAuth.email;

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
        Navigator.of(context, rootNavigator: true).pop();
        await userCollection.doc(email).update(newData);
        successToast(message: "Berhasil update user");
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        dangerToast(message: "Gagal update user");
      }
    }
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
}
