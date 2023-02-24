import 'package:akarosmi/app/core/theme/theme_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle regularFjallaOne(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.fjallaOne,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle extraLight(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w200,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle light(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle regular(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle medium(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle semiBold(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle bold(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }

  static TextStyle extraBold(
    double size, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    FontFamily? font = FontFamily.karla,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: font?.name,
      color: color,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size.sp,
    );
  }
}
