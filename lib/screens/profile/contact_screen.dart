import 'package:flutter/material.dart';
import 'package:gl_app/styles/text_styles.dart';
import 'package:gl_app/widgets/profile_bg_widget.dart';
import 'package:go_router/go_router.dart';

import '../../styles/color_pallete.dart';
import '/widgets/contactList_widget.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileBackgroundWidget(),
          Expanded(
            child: Container(
              width: 300,
              child: ListView(
                children: [
                  Center(child: Text('List Kontak', style: TextPrimary.header)),
                  Center(child: Text('Pengurus RT', style: TextPrimary.header)),
                  SizedBox(height: 30),
                  ContactListWidget(
                    name: "Bpk. Winoto (Ketua)",
                    contactNumber: "+6285175435207",
                  ),
                  ContactListWidget(
                    name: "Bpk. Hendar (Sekertaris)",
                    contactNumber: "+6285175435207",
                  ),
                  ContactListWidget(
                    name: "Bpk. Andry (Bendahara)",
                    contactNumber: "+6285175435207",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {
            context.go('/profile');
          },
          child: Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          foregroundColor: Colorz.primary,
        ),
      ),
    );
  }
}
