import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Obx(() {
        if (controller.listOfPersonData.data == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listOfPersonData.data?.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  extentRatio: 0.27,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        Get.toNamed(Routes.ADD_PERSON_DETAILS_PAGE,
                            arguments: index);
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
                          _BottomSheetView(index),
                        );
                      },
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    "${(controller.listOfPersonData.data?[index].firstName)} ${(controller.listOfPersonData.data?[index].lastName)}",
                    style: Styles.bold(18),
                  ),
                  subtitle: Text(
                    "${controller.listOfPersonData.data?[index].email}",
                    style: Styles.regular(18),
                  ),
                ),
              );
            },
          );
        }
      }),
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
                            "Are you sure you want to delete ${controller.listOfPersonData.data?[index].firstName}?",
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
                                    id: "${controller.listOfPersonData.data?[index].personId}");
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
