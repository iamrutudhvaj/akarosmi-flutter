import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class ForgetPasswordPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  Future<void> userForgetPassword() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.forgetPassword(requestData: {
        "email": emailController.text,
      });
      Get.offAllNamed(Routes.LOGIN_PAGE, arguments: emailController.text);
      ToastUtils.showBottomSnackbar("${response.message}");
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
