import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  final appController = Get.find<AppController>();

  @override
  void onInit() {
    emailController.text = (Get.arguments as String?) ?? '';
    super.onInit();
  }

  Future<void> userLogin() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.login(requestData: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      appController.userData = response.data;
      await StorageService.setToken(response.data?.token ?? '');
      Get.back();
      Get.offAllNamed(Routes.HOME_PAGE);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
