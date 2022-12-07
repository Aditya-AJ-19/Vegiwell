import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2.48);
    path.quadraticBezierTo(
        size.width / 2.5, size.height, size.width, size.height / 1.58);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // todo implement shouldReclip
    return true;
  }
}
