import 'dart:ui';

import'package:flutter/material.dart';
class CustomStyleText{

  static TextStyle header({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }
  static TextStyle subheader({Color? color,FontWeight ? fontweight}) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: fontweight?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

}