import 'package:akarosmi/app/data/model/request_model/add_person_request_model.dart';
import 'package:akarosmi/app/modules/persons_page/controllers/persons_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';

class AddPersonDetailsPageController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  final personsPageController = Get.find<PersonsPageController>();
  Future<void> addPersonData() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.addPerson(
          requestData: AddPersonRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobileNumber: mobileNumberController.text,
        email: emailController.text,
        reference: referenceController.text,
      ));
      ToastUtils.showBottomSnackbar("${response["message"]}");
      personsPageController.personListData();
      Get.back();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
