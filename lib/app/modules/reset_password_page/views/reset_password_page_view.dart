import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/reset_password_page_controller.dart';

class ResetPasswordPageView extends GetView<ResetPasswordPageController> {
  const ResetPasswordPageView({Key? key}) : super(key: key);
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
            Center(
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.greyWhite,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Set New Password",
              style: Styles.regular(25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Your new password must be different to previously used passwords.",
              textAlign: TextAlign.center,
              style: Styles.regular(16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => CustomTextFormField(
                controller: controller.oldPasswordCotroller,
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
                controller: controller.newPasswordCotroller,
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
                controller: controller.confirmPasswordCotroller,
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
