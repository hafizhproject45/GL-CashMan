import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'toast.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 250,
          width: screenWidth,
          child: const Image(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 60),
            const SizedBox(
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
                    'Unknown user',
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
            const SizedBox(height: 10),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offNamed('/');
                successToast(message: "Berhasil Logout");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size.fromWidth(130),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Row(
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

  // Stream<List<M_User>> _readData() {
  //   final emailAuth = FirebaseAuth.instance.currentUser!.email;

  //   final userCollection = FirebaseFirestore.instance
  //       .collection("users")
  //       .where('email', isEqualTo: emailAuth);

  //   return userCollection.snapshots().map((querySnapshot) =>
  //       querySnapshot.docs.map((e) => M_User.fromSnapshot(e)).toList());
  // }
}
