import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.white),
          title: Text(
            "Edit Profile",
            style: Styles.semiBold(
              20,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    controller: controller.firstNameController,
                    hintText: "First name",
                    textInputType: TextInputType.name,
                    label: "First name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a First Name.";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: controller.lastNameController,
                    hintText: "Last name",
                    textInputType: TextInputType.name,
                    label: "Last name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Last Name.";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    readonly: true,
                    label: "Date of birth",
                    controller: controller.dobController,
                    hintText: "Date of birth",
                    suffixIcon: Icon(Icons.calendar_today_outlined,
                        color: AppColors.primary),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Date of birth.";
                      }
                    },
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              dialogTheme: const DialogTheme(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)))),
                              colorScheme: ColorScheme.light(
                                primary: AppColors
                                    .primary, // header background color
                                onPrimary: AppColors.white, // header text color
                                onSurface: AppColors.primary, // body text color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      AppColors.black, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        controller.dobController.text = formattedDate;
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Gender",
                        style: Styles.regular(20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.genderItem
                        .map((e) => Row(
                              children: [
                                Obx(
                                  () => Radio(
                                    value: e,
                                    groupValue: controller.selectedGender.value,
                                    onChanged: (value) {
                                      controller.selectedGender.value = value;
                                    },
                                    activeColor: AppColors.primary,
                                    fillColor: MaterialStateProperty.all(
                                        AppColors.primary),
                                  ),
                                ),
                                Text(e,
                                    style: Styles.semiBold(18,
                                        color: AppColors.black)),
                              ],
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: controller.phoneNumberController,
                    label: "Mobile number",
                    hintText: "Mobile number",
                    textInputType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter a Mobile Number";
                      } else if (!RegExp(
                              r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                          .hasMatch(value)) {
                        return "Please Enter a Valid Phone Number";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    label: "Email",
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter a email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please Enter a Valid email";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: PrimaryButton(
                      width: 150.w,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.editProfile();
                        }
                      },
                      child: const Text("Update Profile"),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: PrimaryButton(
                      color: AppColors.grey,
                      width: 150.w,
                      onPressed: () {
                        Get.bottomSheet(
                          barrierColor: AppColors.black.withOpacity(0.3),
                          const _BottomSheetView(),
                        );
                      },
                      child: Text(
                        "Delete User",
                        style: Styles.semiBold(18, color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _BottomSheetView extends StatelessWidget {
  const _BottomSheetView();

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfilePageController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 287.h,
      decoration: BoxDecoration(
          color: const Color(0xffEAE9E7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.sp),
            topRight: Radius.circular(23.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20.sp,
            )
          ]),
      child: Form(
        key: controller.formGlobalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Delete User Permanent",
              style: Styles.regular(18,
                  fontWeight: FontWeight.w600, color: AppColors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormField(
              controller: controller.passwordController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Password must be required.";
                }
              },
              hintText: "Enter Password",
              label: 'Enter Your Account Password',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                  borderAll: true,
                  color: AppColors.white,
                  borderColor: AppColors.darkGrey,
                  width: 150.w,
                  child: Text(
                    "Cancel",
                    style: Styles.regular(16,
                        fontWeight: FontWeight.w600, color: AppColors.black),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                PrimaryButton(
                  borderAll: true,
                  width: 150.w,
                  child: Text(
                    "Delete",
                    style: Styles.regular(
                      16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if (controller.formGlobalKey.currentState!.validate()) {
                      Get.dialog(
                        AlertDialog(
                          content: Text(
                            textAlign: TextAlign.center,
                            "Are you sure you want to delete your Account Permanently?",
                            style: Styles.bold(18),
                          ),
                          actions: <Widget>[
                            const SizedBox(
                              width: 50,
                            ),
                            MaterialButton(
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            MaterialButton(
                              onPressed: controller.deleteUser,
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
