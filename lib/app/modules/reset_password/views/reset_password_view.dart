import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: Styles.normal(25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => CustomTextFormField(
                obscureText: controller.obsecureText,
                icon: Icon(
                  Icons.lock,
                  color: AppColors.black,
                ),
                hintText: "Old password",
                suffixIcon: InkWell(
                  child: Icon(
                    controller.obsecureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.black,
                    size: 20.sp,
                  ),
                  onTap: () {
                    controller.obsecureText = !controller.obsecureText;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => CustomTextFormField(
                obscureText: controller.obsecureTextNewPass,
                icon: Icon(
                  Icons.lock,
                  color: AppColors.black,
                ),
                hintText: "New password",
                suffixIcon: InkWell(
                  child: Icon(
                    controller.obsecureTextNewPass
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.black,
                    size: 20.sp,
                  ),
                  onTap: () {
                    controller.obsecureTextNewPass =
                        !controller.obsecureTextNewPass;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => CustomTextFormField(
                obscureText: controller.obsecureTextConfirmPass,
                icon: Icon(
                  Icons.lock,
                  color: AppColors.black,
                ),
                hintText: "Confirm password",
                suffixIcon: InkWell(
                  child: Icon(
                    controller.obsecureTextConfirmPass
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.black,
                    size: 20.sp,
                  ),
                  onTap: () {
                    controller.obsecureTextConfirmPass =
                        !controller.obsecureTextConfirmPass;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            PrimaryButton(
              width: 150.w,
              onPressed: () {},
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    )));
  }
}
