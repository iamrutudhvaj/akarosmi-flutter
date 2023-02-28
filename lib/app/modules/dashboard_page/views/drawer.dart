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
              color: AppColors.black,
            ),
            child: SizedBox(
              width: Get.width,
              child: Text(
                'AKAROSMI',
                style: Styles.regularFjallaOne(30, color: AppColors.white),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.security,
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
