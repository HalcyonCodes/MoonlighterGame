
import 'package:flutter/material.dart';

//通过裁剪遮住滚动项目越界
class RectangleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRect(Rect.fromLTRB(-500, 0, 1920, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}