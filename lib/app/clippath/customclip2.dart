import 'package:flutter/material.dart';

class GamePageClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    final double controlX = w / 2;
    final double controlY = h / 2;
    final double peakX = size.width;
    const double peakY = 0.0;

    path.moveTo(0, size.height - 100); // Move to the bottom-left corner
    path.quadraticBezierTo(
        controlX, controlY, peakX, peakY); // Create quadratic Bezier curve
    path.lineTo(size.width, 0); // Line to top-right corner
    path.lineTo(size.width, size.height); // Line to bottom-right corner
    path.lineTo(0, size.height); // Line back to bottom-left corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
