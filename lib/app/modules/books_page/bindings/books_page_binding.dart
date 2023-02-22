import 'package:get/get.dart';

import '../controllers/books_page_controller.dart';

class BooksPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksPageController>(
      () => BooksPageController(),
    );
  }
}
