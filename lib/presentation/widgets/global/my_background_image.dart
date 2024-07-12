import 'package:flutter/material.dart';

class MyBackgroundImage extends StatelessWidget {
  final List<Widget> children;

  const MyBackgroundImage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: children,
    );
  }
}
