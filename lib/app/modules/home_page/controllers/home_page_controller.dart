import 'package:akarosmi/app/modules/books_page/views/books_page_view.dart';
import 'package:akarosmi/app/modules/dashboard_page/views/dashboard_page_view.dart';
import 'package:akarosmi/app/modules/persons_page/views/persons_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../routes/app_pages.dart';

class HomePageController extends GetxController {
  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;
  set selectedTab(int value) => _selectedTab.value = value;

  void changeTabIndex(int index) {
    selectedTab = index;
  }

  List bodyPageViewList = [
    const DashboardPageView(),
    const BooksPageView(),
    const PersonsPageView(),
  ];
  List<String> titleList = [
    'DashboardPageView',
    'Books',
    'Add Person',
  ];
  List actionIconList = [
    const SizedBox(),
    IconButton(
      onPressed: () {
        Get.toNamed(Routes.ADD_BOOK_PAGE);
      },
      icon: Icon(
        Icons.add_box,
        color: AppColors.black,
        size: 30,
      ),
    ),
    IconButton(
      onPressed: () {
        Get.toNamed(Routes.ADD_PERSON_DETAILS_PAGE);
      },
      icon: Icon(
        Icons.person_add,
        color: AppColors.black,
      ),
    ),
  ];
}
