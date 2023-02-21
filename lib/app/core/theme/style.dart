import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle normal(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    //FontFamily? font = FontFamily.Inter,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      // fontFamily: font?.name,
      color: color,
      height: 1.25,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }
}
