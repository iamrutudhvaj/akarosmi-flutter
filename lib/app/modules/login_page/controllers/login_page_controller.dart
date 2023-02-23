import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController emailCotroller = TextEditingController();

  final appController = Get.find<AppController>();

  final _obsecureText = true.obs;
  bool get obsecureText => _obsecureText.value;
  set obsecureText(bool value) => _obsecureText.value = value;

  Future<void> userLogin() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.login(reqestData: {
        "email": emailCotroller.text,
        "password": passwordCotroller.text,
      });
      appController.userData = response.data;
      Get.offAllNamed(Routes.HOME_PAGE);
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("${(e.response?.data as Map)["message"]}")));
    }
  }
}
