import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../controller/app_controller.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_transaction_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class BookDetailPageController extends GetxController {
  HomePageController homePageController = Get.find();
  AppController appController = Get.find();

  final _listByBookId = <TransactionData>[].obs;
  List<TransactionData> get listByBookId => _listByBookId;
  set listByBookId(List<TransactionData> value) => _listByBookId.value = value;

  String? bookId;
  @override
  void onInit() {
    bookId = Get.arguments;
    getListByBookId();
    super.onInit();
  }

  Future<void> getListByBookId() async {
    try {
      final response = await AuthRepository.getListByBookId(
          bookId: bookId!, page: 1, limit: 10);
      listByBookId.assignAll(response.data ?? []);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
