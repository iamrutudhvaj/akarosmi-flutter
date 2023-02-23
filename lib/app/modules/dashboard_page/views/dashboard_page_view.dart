import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:akarosmi/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.black,
              ),
              child: Text(
                'AKAROSMI',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.RESET_PASSWORD_PAGE);
              },
              child: ListTile(
                leading: Icon(
                  Icons.security,
                  color: AppColors.white,
                ),
                title: Text(
                  'Change Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 400.h),
              child: PrimaryButton(
                borderAll: true,
                onPressed: () {},
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          'DashboardPageView',
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              StorageService.clearToken();
            },
            child: Text(
              'Log Out',
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "${StorageService.getToken()}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
