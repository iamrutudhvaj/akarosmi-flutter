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

  String? id;
  late int? index;

  @override
  void onInit() {
    index = Get.arguments;
    if (index != null) {
      firstNameController.text =
          "${personsPageController.listOfPersonData.data?[index!].firstName}";
      lastNameController.text =
          "${personsPageController.listOfPersonData.data?[index!].lastName}";
      mobileNumberController.text =
          "${personsPageController.listOfPersonData.data?[index!].mobileNumber}";
      emailController.text =
          "${personsPageController.listOfPersonData.data?[index!].email}";
      emailController.text =
          "${personsPageController.listOfPersonData.data?[index!].reference}";
      id = "${personsPageController.listOfPersonData.data?[index!].personId}";
    }
    super.onInit();
  }

  Future<void> addPerson() async {
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
      personsPageController.getPersonList();
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> editPerson() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.editPerson(
        requestData: AddPersonRequestModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          mobileNumber: mobileNumberController.text,
          email: emailController.text,
          reference: referenceController.text,
        ),
        personID: id!,
      );
      ToastUtils.showBottomSnackbar("${response["message"]}");
      personsPageController.getPersonList();
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
