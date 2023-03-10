import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/request_model/insert_transaction_request_model.dart';
import '../../../data/model/response_model/list_of_book_user_response.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../data/repository/auth_repository.dart';

class AddTransactionPageController extends GetxController {
  TextEditingController returnDateController = TextEditingController();

  final _status = ''.obs;
  String get status => _status.value;
  set status(String value) => _status.value = value;

  AppController appController = Get.find();
  HomePageController homePageController = Get.find();

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  final formKey = GlobalKey<FormState>();

  String? selectedStatus;
  PersonData? selectedPerson;
  BookData? selectedBook;

  String? transactionId;
  late int? index;

  @override
  void onInit() {
    index = Get.arguments;

    if (index != null) {
      var transaction = appController.listOfTransaction[index!];
      transactionId = transaction.id;
      selectedBook = appController.listOfBooks
          .where((e) => e.bookId == transaction.bookId)
          .first;
      selectedPerson = appController.listOfPersonData
          .where((e) => e.personId == transaction.personId)
          .first;
      returnDateController.text = transaction.returnDate ?? "";
      if (transaction.status == '1') {
        selectedStatus = 'Available';
      } else if (transaction.status == '2') {
        selectedStatus = 'Allocated';
      } else {
        selectedStatus = 'Away';
      }
    }
    super.onInit();
  }

  getStatus() {
    if (selectedStatus == 'Available') {
      status = "1";
    } else if (selectedStatus == 'Allocated') {
      status = "2";
    } else {
      status = "3";
    }
  }

  Future<void> insertTransaction() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      getStatus();
      final response = await AuthRepository.insertTransaction(
          requestData: InsertTransactionRequestModel(
        bookId: selectedBook?.bookId,
        personId: selectedPerson?.personId,
        borrowedDate: currentDate,
        returnDate: returnDateController.text,
        status: status,
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

  Future<void> updateTransaction() async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      getStatus();
      final response = await AuthRepository.updateTransaction(
        requestData: InsertTransactionRequestModel(
          bookId: selectedBook?.bookId,
          personId: selectedPerson?.personId,
          borrowedDate: currentDate,
          returnDate: returnDateController.text,
          status: status,
        ),
        transactionId: transactionId!,
      );
      ToastUtils.showBottomSnackbar("${response.message}");
      await homePageController.getTransactionList();
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
