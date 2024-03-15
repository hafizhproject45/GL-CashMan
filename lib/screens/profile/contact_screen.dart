import 'package:flutter/material.dart';
import 'package:gl_app/utils/text_styles.dart';
import 'package:go_router/go_router.dart';

import '/utils/color_pallete.dart';
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
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 250,
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Hafizh Athallah Y.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Center(child: Text('Contact List', style: TextPrimary.header)),
                SizedBox(height: 30),
                Center(
                  child: Text('Satpam', style: TextGrey.body),
                ),
                ContactListWidget(
                  name: "Bpk. Rahmat",
                ),
                ContactListWidget(
                  name: "Bpk. Arifin",
                ),
                ContactListWidget(
                  name: "Bpk. Tatang",
                ),
                ContactListWidget(
                  name: "Bpk. Koswara",
                ),
                SizedBox(height: 30),
                Center(
                  child: Text('Pengurus RT', style: TextGrey.body),
                ),
                ContactListWidget(
                  name: "Bpk. Winoto (Ketua)",
                ),
                ContactListWidget(
                  name: "Bpk. Hendar (Sekertaris)",
                ),
                ContactListWidget(
                  name: "Bpk. Andry (Bendahara)",
                ),
              ],
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
          foregroundColor: ColorPallete.primaryColor,
        ),
      ),
    );
  }
}
