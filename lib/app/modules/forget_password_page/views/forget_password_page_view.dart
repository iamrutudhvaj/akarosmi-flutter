import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/forget_password_page_controller.dart';

class ForgetPasswordPageView extends GetView<ForgetPasswordPageController> {
  const ForgetPasswordPageView({Key? key}) : super(key: key);
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
              "No worries, we'll send you reset instructions.",
              textAlign: TextAlign.center,
              style: Styles.normal(16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Forget Password",
              style: Styles.normal(25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormField(
              icon: Icon(
                Icons.email,
                color: AppColors.black,
              ),
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            PrimaryButton(
              width: 150.w,
              onPressed: () {
                Get.toNamed(Routes.LOGIN_PAGE);
              },
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    )));
  }
}
