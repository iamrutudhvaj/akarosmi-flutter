import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../data/repository/auth_repository.dart';

class PersonsPageController extends GetxController {
  final _listOfPersonData = ListOfPersonResponseModel().obs;
  ListOfPersonResponseModel get listOfPersonData => _listOfPersonData.value;
  set listOfPersonData(ListOfPersonResponseModel value) =>
      _listOfPersonData.value = value;

  @override
  void onInit() {
    personListData();
    super.onInit();
  }

  Future<void> personListData() async {
    try {
      final response = await AuthRepository.listOfPersonData();
      listOfPersonData = response;
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> deletePersonData({required String id}) async {
    try {
      final response = await AuthRepository.deletePersonData(personID: id);
      listOfPersonData = response;
      ToastUtils.showBottomSnackbar("${response.message}");
      personListData();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
