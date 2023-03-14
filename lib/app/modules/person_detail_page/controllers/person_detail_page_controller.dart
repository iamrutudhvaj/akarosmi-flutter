import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../controller/app_controller.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_transaction_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class PersonDetailPageController extends GetxController {
  HomePageController homePageController = Get.find();
  AppController appController = Get.find();

  final _listByPersonId = <TransactionData>[].obs;
  List<TransactionData> get listByPersonId => _listByPersonId;
  set listByPersonId(List<TransactionData> value) =>
      _listByPersonId.value = value;

  String? personId;
  @override
  void onInit() {
    personId = Get.arguments;
    getListByPersonId();
    super.onInit();
  }

  Future<void> getListByPersonId() async {
    try {
      final response = await AuthRepository.getListByPersonId(
          personId: personId!, page: 1, limit: 10);
      listByPersonId.assignAll(response.data ?? []);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
