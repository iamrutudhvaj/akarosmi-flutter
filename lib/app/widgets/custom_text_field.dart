import 'package:flutter/material.dart';
import '../core/theme/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final dynamic validator;
  final bool? hasPadding;
  final bool? obscureText;
  final dynamic onChanged;
  final dynamic suffixIcon;
  final dynamic icon;
  final TextInputType? textInputType;
  final int? maxLength;
  final dynamic onTap;
  final dynamic focusNode;
  final bool? readonly;
  final bool? errorBorder;
  final String? label;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
    this.hasPadding = true,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.focusNode,
    this.errorBorder = false,
    this.obscureText = false,
    this.icon,
    this.textInputType,
    this.maxLength,
    this.readonly = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding == true
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        readOnly: readonly!,
        obscureText: obscureText!,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          counterText: "",
          fillColor: AppColors.fillColor,
          labelText: label,
          labelStyle: TextStyle(color: AppColors.black),
          filled: true,
          prefixIcon: icon,
          focusColor: AppColors.black,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.black,
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
        keyboardType: textInputType,
        maxLength: maxLength,
      ),
    );
  }
}
