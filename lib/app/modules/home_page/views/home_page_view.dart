import 'package:akarosmi/app/core/theme/color.dart';
import 'package:flutter/material.dart';

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
        elevation: 5,
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Obx(
          () => Text(
            controller.titleList[controller.selectedTab],
            style: Styles.regular(
              20,
              color: AppColors.black,
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
