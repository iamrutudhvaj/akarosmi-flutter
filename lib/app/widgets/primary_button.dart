import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/color.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool? enabled;
  final Color? color;
  final Color? borderColor;
  final bool? hasPadding;
  final double? height;
  final double? verticalPadding;
  final bool? borderAll;
  final double? width;
  final bool? elevation;
  const PrimaryButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.color = Colors.black,
      this.enabled = true,
      this.hasPadding = true,
      this.borderAll = false,
      this.elevation = false,
      this.height,
      this.verticalPadding,
      this.width,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height,
      padding: hasPadding! ? EdgeInsets.symmetric(horizontal: 10.sp) : null,
      child: ElevatedButton(
        onPressed: (enabled == true) ? onPressed : () {},
        style: ElevatedButton.styleFrom(
            elevation: (elevation == true) ? 5 : 0,
            shape: borderAll == false
                ? const StadiumBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
            side: borderAll == true
                ? BorderSide(color: borderColor ?? AppColors.greyWhite)
                : null,
            backgroundColor:
                (enabled == true) ? color : color?.withOpacity(0.6),
            shadowColor: (enabled == true && elevation == true)
                ? AppColors.blue
                : AppColors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 16.sp,
            )),
        child: child,
      ),
    );
  }
}
