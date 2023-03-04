import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/toast.dart';
import '../../../data/model/request_model/insert_transaction_request_model.dart';
import '../../../data/model/response_model/list_of_book_user_response.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../data/repository/auth_repository.dart';

class AddTransactionPageController extends GetxController {
  TextEditingController returnDateController = TextEditingController();

  AppController appController = Get.find();
  HomePageController homePageController = Get.find();

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  final formKey = GlobalKey<FormState>();

  PersonData? selectedPerson;
  BookData? selectedBook;

  Future<void> insertTransaction() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.insertTransaction(
          requestData: InsertTransactionRequestModel(
        bookId: selectedBook?.bookId,
        personId: selectedPerson?.personId,
        borrowedDate: currentDate,
        returnDate: returnDateController.text,
      ));
      ToastUtils.showBottomSnackbar("${response["message"]}");
      homePageController.getTransactionList();
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
