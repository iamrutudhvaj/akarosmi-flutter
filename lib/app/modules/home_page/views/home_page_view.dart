import 'package:akarosmi/app/core/theme/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DashboardBottomNavigationBar(),
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
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: controller.changeTabIndex,
        currentIndex: controller.selectedTab,
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Places',
          ),
        ],
      ),
    );
  }
}
