import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/app_controller.dart';
import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class PersonsPageController extends GetxController {
  AppController appController = Get.find();
  HomePageController homePageController = Get.find();
  TextEditingController passwordController = TextEditingController();

  final _personList = <PersonData>[].obs;
  List<PersonData> get personList => _personList;
  set personList(List<PersonData> value) => _personList.value = value;

  final _result = <PersonData>[].obs;
  List<PersonData> get result => _result;
  set result(List<PersonData> value) => _result.value = value;

  @override
  void onInit() {
    personList = appController.listOfPersonData;
    super.onInit();
  }

  void searchFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      result = appController.listOfPersonData;
    } else {
      result = appController.listOfPersonData
          .where((e) => "${e.firstName} ${e.lastName}"
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    personList = result;
  }

  final formGlobalKey = GlobalKey<FormState>();
  Future<void> deletePerson({required String id}) async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deletePerson(
        requestData: {
          "password": passwordController.text,
        },
        personID: id,
      );
      passwordController.clear();
      appController.listOfPersonData.assignAll(response.data ?? []);
      Get.back(closeOverlays: true);
      homePageController.getPersonList();
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
