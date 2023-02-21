import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primaryButton.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.greyWhite,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/login.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Login Page",
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    obscureText: controller.obsecureText,
                    icon: Icon(
                      Icons.lock,
                      color: AppColors.black,
                    ),
                    hintText: "Password",
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
                  height: 20.h,
                ),
                PrimaryButton(
                  width: 150.w,
                  onPressed: () {},
                  child: const Text("login"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: AppColors.grey),
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: "Ragister",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.HOME_PAGE),
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ));
  }
}
