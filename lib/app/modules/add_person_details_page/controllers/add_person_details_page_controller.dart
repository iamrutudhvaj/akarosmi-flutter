import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/data/model/request_model/add_person_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class AddPersonDetailsPageController extends GetxController {
  HomePageController homePageController = Get.find();
  AppController appController = Get.find();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? id;
  late int? index;

  @override
  void onInit() {
    index = Get.arguments;
    if (index != null) {
      firstNameController.text =
          "${appController.listOfPersonData[index!].firstName}";
      lastNameController.text =
          "${appController.listOfPersonData[index!].lastName}";
      mobileNumberController.text =
          "${appController.listOfPersonData[index!].mobileNumber}";
      emailController.text = "${appController.listOfPersonData[index!].email}";
      referenceController.text =
          "${appController.listOfPersonData[index!].reference}";
      id = "${appController.listOfPersonData[index!].personId}";
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
      await homePageController.getPersonList();
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
      await homePageController.getPersonList();
      index = null;
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
