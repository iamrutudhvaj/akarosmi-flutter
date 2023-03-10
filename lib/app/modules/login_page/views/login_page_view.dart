import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Login Page",
                  style: Styles.regular(25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  controller: controller.emailController,
                  icon: Icon(
                    Icons.email,
                    color: AppColors.primary,
                  ),
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.obscureText,
                    icon: Icon(
                      Icons.lock,
                      color: AppColors.primary,
                    ),
                    hintText: "Password",
                    suffixIcon: InkWell(
                      child: Icon(
                        controller.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.black,
                        size: 20.sp,
                      ),
                      onTap: () {
                        controller.obscureText = !controller.obscureText;
                      },
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.FORGET_PASSWORD_PAGE,
                      );
                    },
                    child: const Text('Forget Password?'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryButton(
                  width: 150.w,
                  onPressed: controller.userLogin,
                  child: const Text("Login"),
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
                        text: "Register",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(
                                Routes.REGISTER_PAGE,
                              ),
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
