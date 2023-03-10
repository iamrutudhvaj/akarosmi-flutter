import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(
          controller.index != null ? "Edit Book" : "Add Book",
          style: Styles.regular(
            20,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: 'Enter name',
                label: 'Enter Name',
                validator: (value) {
                  if (value.isEmpty) {
                    return "Field Can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormField(
                controller: controller.authoreNameController,
                hintText: 'Enter author name',
                label: 'Enter Author Name',
                validator: (value) {
                  if (value.isEmpty) {
                    return "Field Can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormField(
                controller: controller.publisherNameController,
                hintText: 'Enter publisher name',
                label: 'Enter Publisher Name',
                validator: (value) {
                  if (value.isEmpty) {
                    return "Field Can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => Visibility(
                  visible: controller.imageUploadList.isNotEmpty,
                  replacement: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        barrierColor: AppColors.black.withOpacity(0.3),
                        const ImageSelectBottomSheet(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 200.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 7.sp,
                        mainAxisSpacing: 7.sp,
                        childAspectRatio: 1.1.sp),
                    itemCount: (controller.imageUploadList.length) + 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (controller.imageUploadList.length == index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              border: Border.all(color: AppColors.black),
                              color: AppColors.fillColor),
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  barrierColor:
                                      AppColors.black.withOpacity(0.3),
                                  const ImageSelectBottomSheet(),
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.add,
                              ),
                              color: AppColors.black,
                            ),
                          ),
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          border: Border.all(color: AppColors.black),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.imageUploadList[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                controller.imageUploadList.removeAt(index);
                              },
                              child: Icon(
                                CupertinoIcons.clear_circled,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: controller.index != null,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        items: ["Available", "Allocated", "Away"]
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.selectedStatus = newValue;
                        },
                        value: controller.selectedStatus,
                        validator: (value) =>
                            value == null ? "Field Can't be empty" : null,
                        decoration: InputDecoration(
                          labelText: 'Select Book Status',
                          hintText: 'Select Book Status',
                          labelStyle: TextStyle(color: AppColors.black),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.primary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              PrimaryButton(
                width: 150.w,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.index != null) {
                      controller.editBook();
                    } else {
                      controller.addBook();
                    }
                  }
                },
                child:
                    Text(controller.index != null ? "Update Book" : "Add Book"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSelectBottomSheet extends GetView<AddBookPageController> {
  const ImageSelectBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: Styles.regular(18,
                fontWeight: FontWeight.w600, color: AppColors.grey),
          ),
          SizedBox(
            height: 45.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => controller.getImage(source: ImageSource.camera),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      size: 70.sp,
                    ),
                    Text(
                      "Camera",
                      style: Styles.regular(16,
                          fontWeight: FontWeight.w600, color: AppColors.black),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.getImage(source: ImageSource.gallery),
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 70.sp,
                    ),
                    Text(
                      "File",
                      style: Styles.regular(16,
                          fontWeight: FontWeight.w600, color: AppColors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
