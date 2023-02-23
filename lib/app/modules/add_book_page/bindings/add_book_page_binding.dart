import 'package:get/get.dart';

import '../controllers/add_book_page_controller.dart';

class AddBookPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddBookPageController>(
      AddBookPageController(),
    );
  }
}
