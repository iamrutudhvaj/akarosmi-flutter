import 'package:akarosmi/app/modules/books_page/controllers/books_page_controller.dart';
import 'package:akarosmi/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:akarosmi/app/modules/persons_page/controllers/persons_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<DashboardPageController>(
      () => DashboardPageController(),
    );
    Get.lazyPut<BooksPageController>(
      () => BooksPageController(),
    );
    Get.lazyPut<PersonsPageController>(
      () => PersonsPageController(),
    );
  }
}
