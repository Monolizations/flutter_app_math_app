import 'package:flutter/material.dart';

class MainPagelClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h * 0.8);
    path.quadraticBezierTo(w * 0.3, h * 1.1, w, h * 0.8);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
