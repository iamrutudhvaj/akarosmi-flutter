import 'package:get/get.dart';

import '../controllers/person_detail_page_controller.dart';

class PersonDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PersonDetailPageController>(
      PersonDetailPageController(),
    );
  }
}
