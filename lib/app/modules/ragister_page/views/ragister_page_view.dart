import 'package:date_time_field/date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primaryButton.dart';
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: DateTimeField(
                controller: controller.dobController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.fillColor,

                  hintText: "Date of Birth",
                  hintStyle: TextStyle(color: AppColors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // labelText: 'My birthday',
                  suffixIcon: IconButton(
                    onPressed: controller.dobController.clear,
                    icon: Icon(
                      Icons.calendar_month_sharp,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
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
                              controller.isselectedCategory = true;
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
          ],
        ),
      ),
    ));
  }
}
