import 'package:akarosmi/app/widgets/custom_text_field.dart';
import 'package:akarosmi/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: RefreshIndicator(
        displacement: 2,
        color: AppColors.black,
        onRefresh: () async {
          await controller.homePageController.getBookList();
        },
        child: Obx(() {
          if (controller.appController.listOfBooks.isEmpty) {
            return controller.appController.dataLoadingProcess();
          } else {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: kToolbarHeight),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.BOOK_DETAIL_PAGE,
                          arguments:
                              "${controller.appController.listOfBooks[index].bookId}");
                    },
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6.0,
                              spreadRadius: 2),
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.0,
                              spreadRadius: 2),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black12),
                                  image: controller.appController
                                          .listOfBooks[index].images!.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              "${controller.appController.listOfBooks[index].images?.first}"),
                                          fit: BoxFit.fitHeight)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.appController.listOfBooks[index].name}",
                                  style: Styles.bold(22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.appController.listOfBooks[index].author}",
                                          style: Styles.regular(15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${controller.appController.listOfBooks[index].publisher}",
                                          style: Styles.regular(15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: PrimaryButton(
                                        borderColor: AppColors.red,
                                        color: AppColors.fillColor,
                                        verticalPadding: 0,
                                        hasPadding: false,
                                        height: 40,
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: AppColors.red,
                                        ),
                                        onPressed: () {
                                          Get.bottomSheet(
                                            barrierColor: AppColors.black
                                                .withOpacity(0.3),
                                            _BottomSheetView(index),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: PrimaryButton(
                                        borderColor: AppColors.red,
                                        color: AppColors.fillColor,
                                        hasPadding: false,
                                        verticalPadding: 0,
                                        height: 40,
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.black,
                                        ),
                                        onPressed: () {
                                          Get.toNamed(Routes.ADD_BOOK_PAGE,
                                              arguments: index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: AppColors.green.withOpacity(.1),
                                    border: Border.all(color: AppColors.green),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Available",
                                    style:
                                        Styles.bold(12, color: AppColors.green),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                itemCount: controller.appController.listOfBooks.length);
          }
        }),
      ),
    );
  }
}

class _BottomSheetView extends StatelessWidget {
  const _BottomSheetView(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BooksPageController>();
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
      child: Form(
        key: controller.formGlobalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Delete Your Own's Book",
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
                            "Are you sure you want to delete ${controller.appController.listOfBooks[index].name}?",
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
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                controller.deleteBook(
                                    id: "${controller.appController.listOfBooks[index].bookId}");
                              },
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
