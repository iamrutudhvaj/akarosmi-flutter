import 'package:akarosmi/app/modules/books_page/views/books_page_view.dart';
import 'package:akarosmi/app/modules/dashboard_page/views/dashboard_page_view.dart';
import 'package:akarosmi/app/modules/persons_page/views/persons_page_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app_controller.dart';
import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class HomePageController extends GetxController {
  AppController appController = Get.find();

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
    IconButton(
      onPressed: () {
        Get.toNamed(Routes.ADD_TRANSACTION_PAGE);
      },
      icon: Icon(
        Icons.add_box,
        color: AppColors.black,
        size: 30,
      ),
    ),
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

  @override
  void onInit() {
    getPersonList();
    getBookList();
    getTransactionList();
    super.onInit();
  }

  Future<void> getPersonList() async {
    try {
      final response = await AuthRepository.getPersonList();
      appController.listOfPersonData.assignAll(response.data ?? []);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> getBookList() async {
    try {
      final response = await AuthRepository.getBookList();
      appController.listOfBooks.assignAll(response.data ?? []);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> getTransactionList() async {
    try {
      final response =
          await AuthRepository.getTransactionList(page: 1, limit: 10);
      appController.listOfTransaction.assignAll(response.data ?? []);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
