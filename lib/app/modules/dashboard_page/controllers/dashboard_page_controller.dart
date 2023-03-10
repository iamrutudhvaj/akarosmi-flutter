import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class DashboardPageController extends GetxController {
  AppController appController = Get.find();
  HomePageController homePageController = Get.find();
  TextEditingController passwordController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  String getStatus(index) {
    if (appController.listOfTransaction[index].status == "1") {
      return 'Available';
    } else if (appController.listOfTransaction[index].status == "2") {
      return 'Allocated';
    } else {
      return 'Away';
    }
  }

  Color getStatusColor(index) {
    if (appController.listOfTransaction[index].status == "1") {
      return const Color(0xff147F7F);
    } else if (appController.listOfTransaction[index].status == "2") {
      return const Color(0xffED9D2F);
    } else {
      return const Color(0xffEA5958);
    }
  }

  Future<void> deleteTransaction({required String id}) async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deleteTransaction(
        requestData: {
          "password": passwordController.text,
        },
        transactionId: id,
      );
      passwordController.clear();
      Get.back(closeOverlays: true);
      homePageController.getTransactionList();
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back(closeOverlays: true);
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
