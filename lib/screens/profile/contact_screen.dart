import 'package:flutter/material.dart';
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
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 250,
            width: double.infinity,
            child: Image(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  "Contact Number",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 30),
                Text(
                  "Pengurus RT",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 10),
                ContactList(
                  name: "Bpk. Winoto",
                ),
                SizedBox(height: 30),
                Text(
                  "Satpam",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 10),
                ContactList(
                  name: "Bpk. Winoto",
                ),
                ContactList(
                  name: "Bpk. Winoto",
                ),
                ContactList(
                  name: "Bpk. Winoto",
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
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
