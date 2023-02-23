import 'package:get/get.dart';

import '../controllers/add_person_details_page_controller.dart';

class AddPersonDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPersonDetailsPageController>(
      () => AddPersonDetailsPageController(),
    );
  }
}
