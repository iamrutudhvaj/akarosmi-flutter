import 'dart:io';

import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/primary_button.dart';
import '../controllers/add_book_page_controller.dart';

class AddBookPageView extends GetView<AddBookPageController> {
  const AddBookPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          'Add Book',
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.name == "Edit Page" ? "Edit Book" : "",
              style: Styles.normal(16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormField(
              controller: controller.nameController,
              hintText: 'Enter name',
              label: 'Enter Name',
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              controller: controller.authoreNameController,
              hintText: 'Enter author name',
              label: 'Enter Author Name',
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              controller: controller.publisherNameController,
              hintText: 'Enter publisher name',
              label: 'Enter Publisher Name',
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  barrierColor: AppColors.black.withOpacity(0.3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 287.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 43.h,
                        ),
                        Text(
                          "Add a photo to your book",
                          style: Styles.normal(18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => controller.getImage(
                                  source: ImageSource.camera),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    size: 70.sp,
                                  ),
                                  Text(
                                    "Camera",
                                    style: Styles.normal(16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.getImage(
                                  source: ImageSource.gallery),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 70.sp,
                                  ),
                                  Text(
                                    "File",
                                    style: Styles.normal(16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 200.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.fillColor,
                        borderRadius: BorderRadius.circular(15.sp),
                        image: controller.imagePath != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(controller.imagePath?.path ?? ''),
                                ),
                                fit: BoxFit.cover)
                            : null,
                      ),
                      child: controller.imagePath != null
                          ? null
                          : const Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            ),
                    ),
                  )),
            ),
            SizedBox(
              height: 60.h,
            ),
            PrimaryButton(
              width: 150.w,
              onPressed: () {
                Get.back();
              },
              child: const Text("Add Book"),
            ),
          ],
        ),
      ),
    );
  }
}
