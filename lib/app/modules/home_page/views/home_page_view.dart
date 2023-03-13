import 'package:akarosmi/app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/theme/style.dart';
import '../../dashboard_page/views/drawer.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DashboardBottomNavigationBar(),
      drawer: const DrawerView(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Obx(
          () => Text(
            controller.titleList[controller.selectedTab],
            style: Styles.semiBold(
              20,
              color: AppColors.white,
            ),
          ),
        ),
        actions: [
          Obx(() => controller.actionIconList[controller.selectedTab]),
        ],
      ),
      body: Obx(() => controller.bodyPageViewList[controller.selectedTab]),
    );
  }
}

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Obx(
      () => BottomNavigationBar(
        selectedIconTheme: const IconThemeData(),
        selectedFontSize: 8,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedLabelStyle: null,
        unselectedLabelStyle: null,
        onTap: controller.changeTabIndex,
        currentIndex: controller.selectedTab,
        backgroundColor: AppColors.primary,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        items: [
          BottomNavigationBarItem(
            icon: Container(
                height: 52.h,
                width: 52.w,
                decoration: BoxDecoration(
                    color: controller.selectedTab == 0
                        ? AppColors.white
                        : AppColors.transparent,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 52.h,
              width: 52.w,
              decoration: BoxDecoration(
                  color: controller.selectedTab == 1
                      ? AppColors.white
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(12.sp)),
              child: const Icon(Icons.menu_book_sharp),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 52.h,
                width: 52.w,
                decoration: BoxDecoration(
                    color: controller.selectedTab == 2
                        ? AppColors.white
                        : AppColors.transparent,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: const Icon(Icons.person)),
            label: 'Places',
          ),
        ],
      ),
    );
  }
}
