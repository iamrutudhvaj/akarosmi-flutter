import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../controller/app_controller.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordPageController extends GetxController {

  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  final _obscureTextNewPass = true.obs;
  bool get obscureTextNewPass => _obscureTextNewPass.value;
  set obscureTextNewPass(bool value) => _obscureTextNewPass.value = value;

  final _obscureTextConfirmPass = true.obs;
  bool get obscureTextConfirmPass => _obscureTextConfirmPass.value;
  set obscureTextConfirmPass(bool value) =>
      _obscureTextConfirmPass.value = value;

  final appController = Get.find<AppController>();
  Future<void> userChangePassword() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.changePassword(
        requestData: {
          "oldPass": oldPasswordController.text,
          "newPass": newPasswordController.text,
          "confPass": confirmPasswordController.text,
        },
      );
      appController.userData = response.data;
      // ignore: todo
      ///TODO: we need to update local storage token by latest token
      StorageService.clearToken();
      Get.offAllNamed(
        Routes.LOGIN_PAGE,
      );
      Get.back();
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        StorageService.clearToken();
        Get.offAllNamed(Routes.LOGIN_PAGE);
      }
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
