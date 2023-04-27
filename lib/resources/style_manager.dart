import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFamily,
  );
}

TextStyle regularTextStyle(
    {double fontSize = 10,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    String fontFamily='NunitoSans'}) {
  return _getTextStyle(fontSize, fontWeight, color, fontFamily);
}
