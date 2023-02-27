import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../data/repository/auth_repository.dart';

class PersonsPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  final _listOfPersonData = PersonListResponse().obs;
  PersonListResponse get listOfPersonData => _listOfPersonData.value;
  set listOfPersonData(PersonListResponse value) =>
      _listOfPersonData.value = value;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getPersonList();
    super.onInit();
  }

  Future<void> getPersonList() async {
    try {
      final response = await AuthRepository.getPersonList();
      listOfPersonData = response;
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> deletePerson({required String id}) async {
    try {
      final response = await AuthRepository.deletePerson(
        requestData: {
          "password": passwordController.text,
        },
        personID: id,
      );
      ToastUtils.showBottomSnackbar("${response.message}");
      passwordController.clear();
      listOfPersonData = response;
      Get.back(closeOverlays: true);
      getPersonList();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
