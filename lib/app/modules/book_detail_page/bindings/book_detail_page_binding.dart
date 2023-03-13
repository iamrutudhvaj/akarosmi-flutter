import 'package:get/get.dart';

import '../controllers/book_detail_page_controller.dart';

class BookDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookDetailPageController>(
      BookDetailPageController(),
    );
  }
}
