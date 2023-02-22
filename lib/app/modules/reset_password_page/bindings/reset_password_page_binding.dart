import 'package:akarosmi/app/modules/reset_password_page/controllers/reset_password_page_controller.dart';
import 'package:get/get.dart';



class ResetPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordPageController>(
      () => ResetPasswordPageController(),
    );
  }
}
