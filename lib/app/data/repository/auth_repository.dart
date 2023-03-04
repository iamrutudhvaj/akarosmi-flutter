import 'package:akarosmi/app/core/constant/uri.dart';
import 'package:akarosmi/app/data/model/request_model/add_book_request_model.dart';
import 'package:akarosmi/app/data/model/response_model/list_of_book_user_response.dart';
import 'package:akarosmi/app/data/model/response_model/list_of_person_response.dart';
import 'package:akarosmi/app/data/model/response_model/registration_response.dart';
import 'package:akarosmi/app/data/network/api_controller.dart';
import 'package:akarosmi/app/data/model/response_model/login_response.dart';

import '../model/request_model/add_person_request_model.dart';
import '../model/request_model/insert_transaction_request_model.dart';
import '../model/response_model/forget_password_response.dart';
import '../model/response_model/list_of_transaction_response.dart';

class AuthRepository {
  static Future<RegistrationResponse> registration(
      {required Map<String, dynamic> requestData}) async {
    final response =
        await ApiController.post(path: UriPath.registration, data: requestData);
    return RegistrationResponse.fromJson(response);
  }

  // Here we are using Login data response for returning data at the place of change password data because both model are same.
  static Future<LoginResponse> changePassword({
    required Map<String, dynamic> requestData,
  }) async {
    final response = await ApiController.post(
      path: UriPath.changePassword,
      data: requestData,
    );
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> login(
      {required Map<String, dynamic> requestData}) async {
    final response = await ApiController.post(
      path: UriPath.login,
      data: requestData,
    );
    return LoginResponse.fromJson(response);
  }

  static Future<ForgetPasswordResponse> forgetPassword(
      {required Map<String, dynamic> requestData}) async {
    final response = await ApiController.post(
      path: UriPath.forgetPassword,
      data: requestData,
    );
    return ForgetPasswordResponse.fromJson(response);
  }

  static Future<Map<String, dynamic>> addBook(
      {required AddBookRequestModel requestData}) async {
    final response = await ApiController.post(
      path: UriPath.addBook,
      data: requestData.toJson(),
    );
    return response;
  }

  static Future<BookListResponse> getBookList() async {
    final response = await ApiController.get(path: UriPath.listUserBook);
    return BookListResponse.fromJson(response);
  }

  static Future<Map<String, dynamic>> addPerson(
      {required AddPersonRequestModel requestData}) async {
    final response = await ApiController.post(
      path: UriPath.addPerson,
      data: requestData.toJson(),
    );
    return response;
  }

  static Future<PersonListResponse> getPersonList() async {
    final response = await ApiController.get(path: UriPath.listOfPerson);
    return PersonListResponse.fromJson(response);
  }

  static Future<PersonListResponse> deletePerson(
      {required Map<String, dynamic> requestData,
      required String personID}) async {
    final response = await ApiController.delete(
      path: '${UriPath.deletePerson}$personID',
      data: requestData,
    );
    return PersonListResponse.fromJson(response!);
  }

  static Future<BookListResponse> deleteBook(
      {required Map<String, dynamic> requestData,
      required String bookID}) async {
    final response = await ApiController.delete(
      path: '${UriPath.deleteBook}$bookID',
      data: requestData,
    );
    return BookListResponse.fromJson(response!);
  }

  static Future<Map<String, dynamic>> editBook(
      {required AddBookRequestModel requestData,
      required String bookID}) async {
    final response = await ApiController.put(
      path: '${UriPath.editBook}$bookID',
      data: requestData.toJson(),
    );
    return response;
  }

  static Future<Map<String, dynamic>> editPerson(
      {required AddPersonRequestModel requestData,
      required String personID}) async {
    final response = await ApiController.put(
      path: '${UriPath.editPerson}$personID',
      data: requestData.toJson(),
    );
    return response;
  }

  static Future<Map<String, dynamic>> insertTransaction(
      {required InsertTransactionRequestModel requestData}) async {
    final response = await ApiController.post(
      path: UriPath.insertTransaction,
      data: requestData.toJson(),
    );
    return response;
  }

  static Future<TransactionListResponse> getTransactionList(
      {required int page, required int limit}) async {
    final response = await ApiController.get(
      path: '${UriPath.listOfTransaction}?page=$page&limit=$limit',
    );
    return TransactionListResponse.fromJson(response);
  }

  static Future<TransactionListResponse> getListByPersonId(
      {required int page, required int limit, required String personId}) async {
    final response = await ApiController.get(
      path: '${UriPath.listByPersonId}$personId?page=$page&limit=$limit',
    );
    return TransactionListResponse.fromJson(response);
  }

  static Future<TransactionListResponse> getListByBookId(
      {required int page, required int limit, required String bookId}) async {
    final response = await ApiController.get(
      path: '${UriPath.listByBookId}$bookId?page=$page&limit=$limit',
    );
    return TransactionListResponse.fromJson(response);
  }

  static Future<TransactionListResponse> deleteTransaction(
      {required Map<String, dynamic> requestData,
      required String transactionId}) async {
    final response = await ApiController.delete(
      path: '${UriPath.deleteTransaction}$transactionId',
      data: requestData,
    );
    return TransactionListResponse.fromJson(response!);
  }

  static Future<RegistrationResponse> editProfile(
      {required Map<String, dynamic> requestData}) async {
    final response =
        await ApiController.post(path: UriPath.editProfile, data: requestData);
    return RegistrationResponse.fromJson(response);
  }
}
