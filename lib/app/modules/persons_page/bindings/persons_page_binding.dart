import 'package:get/get.dart';

import '../controllers/persons_page_controller.dart';

class PersonsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonsPageController>(
      () => PersonsPageController(),
    );
  }
}
