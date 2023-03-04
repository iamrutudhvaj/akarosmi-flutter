import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 2,
        color: AppColors.black,
        onRefresh: () async {
          await controller.homePageController.getPersonList();
        },
        child: Obx(() {
          if (controller.appController.listOfPersonData.isEmpty) {
            return controller.appController.dataLoadingProcess();
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.appController.listOfPersonData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PERSON_DETAIL_PAGE,
                        arguments:
                            "${controller.appController.listOfPersonData[index].personId}");
                  },
                  child: ListTile(
                    title: Text(
                      "${(controller.appController.listOfPersonData[index].firstName)} ${(controller.appController.listOfPersonData[index].lastName)}",
                      style: Styles.bold(18),
                    ),
                    subtitle: Text(
                      "${controller.appController.listOfPersonData[index].email}",
                      style: Styles.regular(18),
                    ),
                    trailing: PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_document,
                                color: AppColors.blue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Edit")
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: AppColors.red),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Delete")
                            ],
                          ),
                        ),
                      ],
                      offset: const Offset(0, 40),
                      elevation: 2,
                      onSelected: (value) {
                        if (value == 1) {
                          Get.toNamed(Routes.ADD_PERSON_DETAILS_PAGE,
                              arguments: index);
                        } else if (value == 2) {
                          Get.bottomSheet(
                            barrierColor: AppColors.black.withOpacity(0.3),
                            _BottomSheetView(index),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            );
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
    var controller = Get.find<PersonsPageController>();
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
                            "Are you sure you want to delete ${controller.appController.listOfPersonData[index].firstName}?",
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
                                controller.deletePerson(
                                    id: "${controller.appController.listOfPersonData[index].personId}");
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
