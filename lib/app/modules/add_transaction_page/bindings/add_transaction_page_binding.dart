import 'package:get/get.dart';

import '../controllers/add_transaction_page_controller.dart';

class AddTransactionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddTransactionPageController>(
      AddTransactionPageController(),
    );
  }
}
