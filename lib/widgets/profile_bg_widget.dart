import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/M_User.dart';
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
  @override
  Widget build(BuildContext context) {
    final emailAuth = FirebaseAuth.instance.currentUser!.email;
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
                  StreamBuilder<List<M_User>>(
                      stream: _readData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final user = snapshot.data!
                            .firstWhere((user) => user.email == emailAuth);

                        return Text(
                          user.fullname ?? '{Unknown user}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                context.go('/');
                successToast(message: "Berhasil Logout");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size.fromWidth(130),
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
            )
          ],
        )
      ],
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
}
