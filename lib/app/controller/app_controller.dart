import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:get/get.dart';

import '../data/model/response_model/login_response.dart';
import '../routes/app_pages.dart';

class AppController extends GetxController {
  final _userData = Rx<UserData?>(null);
  UserData? get userData => _userData.value;
  set userData(UserData? value) => _userData.value = value;

  bool firstTimeCheckForNavigation = true;
  void checkAuthStatus() {
    final token = StorageService.getToken();

    if (token != null) {
      Get.offAllNamed(Routes.HOME_PAGE);
    } else {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    }
  }
}
