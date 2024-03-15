import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:go_router/go_router.dart';

import '../styles/color_pallete.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

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
      bottomNavigationBar: CurvedNavigationBar(
        // index: 0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        buttonBackgroundColor: Colorz.primary,
        color: Colorz.primary,
        animationDuration: Duration(milliseconds: 400),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.payment,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        animationCurve: Curves.easeInOut,
        height: 65,
        onTap: (index) {
          setState(() {
            initIndex = index;
          });
          _gotoBranch(initIndex);
        },
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
    );
  }
}
