import 'package:flutter/material.dart';

class TextCommon {
  static TextStyle postTitleStyle(
      {double fontWidth, bool colorChangeBlack, bool fontWeight}) {
    return TextStyle(
        // fontFamily: 'Poppins',
        // fontWeight: FontWeight.w600,
        fontSize: fontWidth,
        fontFamily: 'Poppins',
        fontWeight: fontWeight ? FontWeight.w700 : FontWeight.w400,
        color: colorChangeBlack ? Colors.black : Color(0xffAB965D));
  }
}
