import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/ragister_page_controller.dart';

class RagisterPageView extends GetView<RagisterPageController> {
  const RagisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
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
            Center(
              child: Text(
                "Ragister Your Account",
                style: Styles.normal(25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextFormField(
              hintText: "Frist Name",
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 15.h,
            ),
            const CustomTextFormField(
              hintText: "Last Name",
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              readonly: true,
              controller: controller.dobController,
              hintText: "Date of Birth",
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dialogTheme: const DialogTheme(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                        colorScheme: ColorScheme.light(
                          primary: AppColors.black, // header background color
                          onPrimary: AppColors.white, // header text color
                          onSurface: AppColors.black, // body text color
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
              height: 15.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                "Gender",
                style: Styles.normal(20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 25.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: controller.genderItem[index],
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.isSelectedCategory = true;
                              controller.selectedGender.value = value;
                            },
                            activeColor: Colors.black,
                            fillColor:
                                MaterialStateProperty.all(AppColors.black),
                          ),
                        ),
                        Text(
                          controller.genderItem[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                  itemCount: controller.genderItem.length),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextFormField(
              hintText: "Mobile No.",
              textInputType: TextInputType.number,
              maxleng: 10,
            ),
            SizedBox(
              height: 15.h,
            ),
            const CustomTextFormField(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: PrimaryButton(
                width: 150.w,
                onPressed: () {},
                child: const Text("Ragister"),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.grey),
                  text: "Already have account? ",
                  children: [
                    TextSpan(
                      text: "Login",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(Routes.LOGIN_PAGE),
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
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
