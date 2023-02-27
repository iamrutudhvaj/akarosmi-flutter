import 'package:akarosmi/app/widgets/custom_text_field.dart';
import 'package:akarosmi/app/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/books_page_controller.dart';

class BooksPageView extends GetView<BooksPageController> {
  const BooksPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 5,
        title: Text(
          "Books",
          style: Styles.regular(
            20,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_BOOK_PAGE);
            },
            icon: Icon(
              Icons.add_box,
              color: AppColors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Obx(() {
            if (controller.listOfUserBookData.data == null) {
              return Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.darkGrey,
                ),
              );
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listOfUserBookData.data?.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      extentRatio: 0.27,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Get.toNamed(Routes.ADD_BOOK_PAGE,
                                arguments: "Edit Page");
                          },
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          icon: Icons.edit_document,
                        ),
                        SlidableAction(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          onPressed: (context) {
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
                                child: Form(
                                  key: controller.formGlobalKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Text(
                                        "Delete Your Own's Book",
                                        style: Styles.regular(18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomTextFormField(
                                        controller:
                                            controller.passwordController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Password must be required.";
                                          }
                                        },
                                        hintText: "Enter Password",
                                        label: 'Enter Your Account Password',
                                        textInputType:
                                            TextInputType.visiblePassword,
                                      ),
                                      SizedBox(
                                        height: 45.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          PrimaryButton(
                                            borderAll: true,
                                            color: AppColors.white,
                                            borderColor: AppColors.darkGrey,
                                            width: 150.w,
                                            child: Text(
                                              "Cancel",
                                              style: Styles.regular(16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black),
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
                                              if (controller
                                                  .formGlobalKey.currentState!
                                                  .validate()) {
                                                Get.back();
                                                showDialog(
                                                  context: Get.context!,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Are you sure you want to delete ${controller.listOfUserBookData.data?[index].name}?",
                                                        style: Styles.bold(18),
                                                      ),
                                                      actions: <Widget>[
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        MaterialButton(
                                                          child: const Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                        MaterialButton(
                                                          child: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          onPressed: () {
                                                            controller
                                                                .deleteBookData(
                                                                    id: "${controller.listOfUserBookData.data?[index].bookId}");
                                                            Get.back();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: ClipOval(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            controller.listOfUserBookData.data?[index]
                                    .thumbnail ??
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNhM2nffNaGqZaLZ2JFTo31IRnciJ97h1NyQ&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        "${controller.listOfUserBookData.data?[index].name}",
                        style: Styles.bold(18),
                      ),
                      subtitle: Text(
                        "${controller.listOfUserBookData.data?[index].publisher}",
                        style: Styles.regular(18),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.listOfUserBookData.data?[index].createdAt?.toString().substring(0, 10)}",
                            style: Styles.regular(16),
                          ),
                          Text(
                            "Time : ${controller.listOfUserBookData.data?[index].createdAt?.toIso8601String().toString().substring(14, 19)}",
                            style: Styles.regular(16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          })
        ],
      ),
    );
  }
}
