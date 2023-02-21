import 'package:get/get.dart';

import '../modules/add_book_page/bindings/add_book_page_binding.dart';
import '../modules/add_book_page/views/add_book_page_view.dart';
import '../modules/books_page/bindings/books_page_binding.dart';
import '../modules/books_page/views/books_page_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/persons_page/bindings/persons_page_binding.dart';
import '../modules/persons_page/views/persons_page_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BOOK_PAGE,
      page: () => const AddBookPageView(),
      binding: AddBookPageBinding(),
    ),
    GetPage(
      name: _Paths.BOOKS_PAGE,
      page: () => const BooksPageView(),
      binding: BooksPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => const DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: _Paths.PERSONS_PAGE,
      page: () => const PersonsPageView(),
      binding: PersonsPageBinding(),
    ),
  ];
}
