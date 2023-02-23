import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:get/get.dart';

import '../data/model/response_model/login_response.dart';
import '../routes/app_pages.dart';

class AppController extends GetxController {
  final _userData = Rx<UserData?>(null);
  UserData? get userData => _userData.value;
  set userData(UserData? value) => _userData.value = value;

  void checkAuthStatus() async {
    final token = await StorageService.getToken();
    if (token != null) {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } else {
      Get.offAllNamed(Routes.HOME_PAGE);
    }
  }
}
