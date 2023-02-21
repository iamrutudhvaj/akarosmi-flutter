import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/color.dart';

class CustomTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final String? hintText;
  final dynamic validator;
  final bool? hasPadding;
  final bool? obscureText;
  final dynamic onChanged;
  final dynamic suffixIcon;
  final dynamic icon;
  final TextInputType? textInputType;
  final int? maxleng;
  // final Color? color;
  final dynamic onTap;
  final dynamic focusNode;
  final bool? errorBorder;

  const CustomTextFormField({
    Key? key,
    // required this.controller,
    this.hintText,
    this.validator,
    // this.color,
    this.hasPadding = true,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.focusNode,
    this.errorBorder = false,
    this.obscureText = false,
    this.icon,
    this.textInputType,
    this.maxleng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasPadding! ? EdgeInsets.symmetric(horizontal: 10.sp) : null,
      child: TextFormField(
        obscureText: obscureText!,
        // controller: controller,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,

        cursorColor: AppColors.black,
        decoration: InputDecoration(
          fillColor: AppColors.fillColor,
          filled: true,
          prefixIcon: icon,
          focusColor: AppColors.blue,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.black),
        ),
        style:
            TextStyle(color: AppColors.black, decoration: TextDecoration.none),
        keyboardType: textInputType, maxLength: maxleng,
      ),
    );
  }
}
