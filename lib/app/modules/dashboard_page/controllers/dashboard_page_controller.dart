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

  final _status = ''.obs;
  String get status => _status.value;
  set status(String value) => _status.value = value;

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
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
