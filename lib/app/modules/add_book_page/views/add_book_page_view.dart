import 'dart:io';

import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/add_book_page_controller.dart';

class AddBookPageView extends GetView<AddBookPageController> {
  const AddBookPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Name',
              style: Styles.normal(16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              hasPadding: false,
              controller: controller.nameController,
              hintText: 'Enter Name',
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Authore Name',
              style: Styles.normal(16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: controller.authoreNameController,
              hasPadding: false,
              hintText: 'Enter Author Name',
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Publisher Name',
              style: Styles.normal(16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: controller.publisherNameController,
              hasPadding: false,
              hintText: 'Enter Publisher Name',
            ),
            SizedBox(
              height: 10.h,
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
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Obx(() => Container(
                    height: 200.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.fillColor,
                      borderRadius: BorderRadius.circular(23.sp),
                    ),
                    child: controller.imagePath != null
                        ? Image.file(
                            File(controller.imagePath?.path ?? ''),
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
