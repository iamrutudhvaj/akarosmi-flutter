import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/response_model/list_of_transaction_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../home_page/controllers/home_page_controller.dart';

class DashboardPageController extends GetxController {
  AppController appController = Get.find();
  HomePageController homePageController = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  final _transactionList = <TransactionData>[].obs;
  List<TransactionData> get transactionList => _transactionList;
  set transactionList(List<TransactionData> value) =>
      _transactionList.value = value;

  final _result = <TransactionData>[].obs;
  List<TransactionData> get result => _result;
  set result(List<TransactionData> value) => _result.value = value;

  @override
  void onInit() {
    transactionList = appController.listOfTransaction;
    super.onInit();
  }

  void searchFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      result = appController.listOfTransaction;
    } else {
      result = appController.listOfTransaction
          .where((e) => "${e.bookName} ${e.personName}"
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    transactionList = result;
  }

  String getStatus(index) {
    if (transactionList[index].status == "1") {
      return 'Available';
    } else if (transactionList[index].status == "2") {
      return 'Allocated';
    } else {
      return 'Away';
    }
  }

  Color getStatusColor(index) {
    if (transactionList[index].status == "1") {
      return const Color(0xff147F7F);
    } else if (transactionList[index].status == "2") {
      return const Color(0xffED9D2F);
    } else {
      return const Color(0xffEA5958);
    }
  }

  Future<void> deleteTransaction({required String id}) async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deleteTransaction(
        requestData: {
          "password": passwordController.text,
        },
        transactionId: id,
      );
      await homePageController.getTransactionList();
      passwordController.clear();
      Get.back(closeOverlays: true);
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back(closeOverlays: true);
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
