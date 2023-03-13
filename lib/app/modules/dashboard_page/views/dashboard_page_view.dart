import 'package:akarosmi/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 2,
        color: AppColors.black,
        onRefresh: () async {
          await controller.homePageController.getTransactionList();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.searchFilter(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    hintText: "Search Transaction",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: AppColors.black),
              ),
            ),
            Obx(() {
              if (controller.appController.listOfTransaction.isEmpty) {
                return controller.appController.dataLoadingProcess();
              } else {
                return Expanded(
                  child: controller.transactionList.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.transactionList.length,
                          padding: const EdgeInsets.all(16),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                          color:
                              controller.getStatusColor(index).withOpacity(.3),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.book),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "${controller.transactionList[index].bookName}",
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "${controller.transactionList[index].personName}",
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.circle,
                                                  color: controller
                                                      .getStatusColor(index)),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                controller.getStatus(index),
                                                style: Styles.medium(16,
                                                    color: controller
                                                        .getStatusColor(index)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.bottomSheet(
                                        barrierColor:
                                            AppColors.black.withOpacity(0.3),
                                              _BottomSheetView(index),
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor: AppColors.white,
                                            side: BorderSide(
                                              color: AppColors.transparent,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.delete_outline,
                                            color: Color(0xffEA5958),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                      Get.toNamed(Routes.ADD_TRANSACTION_PAGE,
                                                arguments: index);
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor: AppColors.white,
                                            side: BorderSide(
                                              color: AppColors.transparent,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: controller.appController.dataLoadingProcess(),
                        ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetView extends StatelessWidget {
  const _BottomSheetView(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DashboardPageController>();
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
              "Delete Your Own's Transaction",
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
                            "Are you sure you want to delete ${controller.transactionList[index].bookName}?",
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
                                controller.deleteTransaction(
                                    id: "${controller.transactionList[index].id}");
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
