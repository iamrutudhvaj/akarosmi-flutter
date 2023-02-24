import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  AppController appController = Get.find();
  Future<void> initializeSettings() async {
    if (appController.firstTimeCheckForNavigation) {
      appController.checkAuthStatus();
      appController.firstTimeCheckForNavigation = false;
    }
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void onReady() {
    initializeSettings();
    super.onReady();
  }
}
