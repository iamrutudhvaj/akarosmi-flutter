import 'package:get/get.dart';

import '../controllers/ragister_page_controller.dart';

class RagisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RagisterPageController>(
      () => RagisterPageController(),
    );
  }
}
