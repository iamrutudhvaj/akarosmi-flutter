import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:akarosmi/app/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_page_controller.dart';

class DrawerView extends GetView<DashboardPageController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: SizedBox(
              width: Get.width,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AKAROSMI',
                          style: Styles.regularFjallaOne(30,
                              color: AppColors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE_PAGE);
                          },
                          icon: Icon(Icons.edit_square, color: AppColors.white),
                        ),
                      ],
                    ),
                    FittedBox(
                      child: Text(
                        '${controller.appController.userData?.firstName} ${controller.appController.userData?.lastName}',
                        style: Styles.regular(24, color: AppColors.white),
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        '${controller.appController.userData?.email}',
                        style: Styles.regular(16, color: AppColors.white),
                      ),
                    ),
                    Text(
                      '${controller.appController.userData?.phoneNumber}',
                      style: Styles.regular(16, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.lock_reset_rounded,
            ),
            title: Text(
              'Change Password',
              style: Styles.regular(
                20,
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.RESET_PASSWORD_PAGE);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
            ),
            title: Text(
              'Rate US',
              style: Styles.regular(
                20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
            ),
            title: Text(
              'Privacy Policy',
              style: Styles.regular(
                20,
              ),
            ),
            onTap: controller.launchURLApp,
          ),
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              StorageService.clearToken()
                  .then((value) => Get.offAllNamed(Routes.LOGIN_PAGE));
            },
            child: Text(
              'Log Out',
              style: Styles.regular(
                20,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
