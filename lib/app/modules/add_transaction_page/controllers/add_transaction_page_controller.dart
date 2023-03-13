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
  TextEditingController bookListController = TextEditingController();
  TextEditingController personListController = TextEditingController();

  final _status = ''.obs;
  String get status => _status.value;
  set status(String value) => _status.value = value;

  AppController appController = Get.find();
  HomePageController homePageController = Get.find();

  final _bookListForAddTransaction = <BookData>[].obs;
  List<BookData> get bookListForAddTransaction => _bookListForAddTransaction;
  set bookListForAddTransaction(List<BookData> value) =>
      _bookListForAddTransaction.value = value;

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String? borrowedDate;
  final formKey = GlobalKey<FormState>();

  String? selectedStatus;
  PersonData? selectedPerson;
  BookData? selectedBook;

  String? transactionId;
  late int? index;

  @override
  void onInit() {
    bookListForAddTransaction.assignAll(appController.listOfBooks);
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
      bookListController.text = selectedBook?.name ?? "";
      personListController.text =
          "${selectedPerson?.firstName} ${selectedPerson?.lastName}";
      returnDateController.text = transaction.returnDate ?? "";
      borrowedDate = transaction.borrowedDate ?? "";
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
      var book = bookListForAddTransaction
          .where((element) => element.name == bookListController.text)
          .first;

      if (book.status != '1') {
        ToastUtils.showBottomSnackbar("Book Is Not Available");
        return;
      }

      final response = await AuthRepository.insertTransaction(
          requestData: InsertTransactionRequestModel(
        bookId: book.bookId,
        personId: appController.listOfPersonData
            .where((e) =>
                '${e.firstName} ${e.lastName}' == personListController.text)
            .first
            .personId,
        borrowedDate: currentDate,
        returnDate: returnDateController.text,
        status: status,
      ));
      await homePageController.getTransactionList();
      ToastUtils.showBottomSnackbar("${response["message"]}");
      homePageController.getBookList();
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
      var book = bookListForAddTransaction
          .where((element) => element.name == bookListController.text)
          .first;

      if (book.status != '1') {
        Get.back(closeOverlays: true);
        ToastUtils.showBottomSnackbar("Book Is Not Available");
        return;
      }
      final response = await AuthRepository.updateTransaction(
        requestData: InsertTransactionRequestModel(
          bookId: book.bookId,
          personId: appController.listOfPersonData
              .where((e) =>
                  '${e.firstName} ${e.lastName}' == personListController.text)
              .first
              .personId,
          borrowedDate: borrowedDate,
          returnDate: returnDateController.text,
          status: status,
        ),
        transactionId: transactionId!,
      );
      homePageController.getTransactionList();
      homePageController.getBookList();
      ToastUtils.showBottomSnackbar("${response.message}");
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
