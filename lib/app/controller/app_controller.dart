import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/color.dart';
import '../core/theme/style.dart';
import '../data/model/response_model/list_of_book_user_response.dart';
import '../data/model/response_model/list_of_person_response.dart';
import '../data/model/response_model/list_of_transaction_response.dart';
import '../data/model/response_model/login_response.dart';
import '../routes/app_pages.dart';

class AppController extends GetxController {
  final _userData = Rx<UserData?>(null);
  UserData? get userData {
    _userData.value ??= StorageService.getUserData();
    return _userData.value;
  }

  set userData(UserData? value) {
    _userData.value = value;
    if (value != null) {
      StorageService.setUserData(value);
    }
  }

  final _listOfBooks = <BookData>[].obs;
  List<BookData> get listOfBooks => _listOfBooks;
  set listOfBooks(List<BookData> value) => _listOfBooks.value = value;

  final _listOfTransaction = <TransactionData>[].obs;
  List<TransactionData> get listOfTransaction => _listOfTransaction;
  set listOfTransaction(List<TransactionData> value) =>
      _listOfTransaction.value = value;

  final _listOfPersonData = <PersonData>[].obs;
  List<PersonData> get listOfPersonData => _listOfPersonData;
  set listOfPersonData(List<PersonData> value) =>
      _listOfPersonData.value = value;

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  bool firstTimeCheckForNavigation = true;
  void checkAuthStatus() {
    final token = StorageService.getToken();

    if (token != null) {
      Get.offAllNamed(Routes.HOME_PAGE);
    } else {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    }
  }

  dataLoadingProcess() {
    if (isLoading == true) {
      Future.delayed(const Duration(seconds: 1))
          .then((value) => isLoading = false);
      return Center(
        child: CupertinoActivityIndicator(
          color: AppColors.darkGrey,
        ),
      );
    } else {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_data_available.png",
            height: 230.sp,
          ),
          Text(
            "No Data Available",
            style: Styles.semiBold(18),
          ),
        ],
      ));
    }
  }
}
