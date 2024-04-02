import 'package:flutter/material.dart';
import 'package:gl_app/styles/color_pallete.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavigationBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  MyNavigationBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int initIndex = 0;

  void _gotoBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colorz.primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black.withOpacity(.15),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            gap: 6,
            activeColor: Colorz.primary,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 500),
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            curve: Curves.easeInOut,
            tabBorderRadius: 15,
            rippleColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.payment,
                text: 'Payment',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: initIndex,
            onTabChange: (index) {
              setState(() {
                initIndex = index;
              });
              _gotoBranch(initIndex);
            },
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
    );
  }
}
