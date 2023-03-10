import 'package:get/get.dart';

import '../modules/add_book_page/bindings/add_book_page_binding.dart';
import '../modules/add_book_page/views/add_book_page_view.dart';
import '../modules/add_person_details_page/bindings/add_person_details_page_binding.dart';
import '../modules/add_person_details_page/views/add_person_details_page_view.dart';
import '../modules/add_transaction_page/bindings/add_transaction_page_binding.dart';
import '../modules/add_transaction_page/views/add_transaction_page_view.dart';
import '../modules/book_detail_page/bindings/book_detail_page_binding.dart';
import '../modules/book_detail_page/views/book_detail_page_view.dart';
import '../modules/books_page/bindings/books_page_binding.dart';
import '../modules/books_page/views/books_page_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/forget_password_page/bindings/forget_password_page_binding.dart';
import '../modules/forget_password_page/views/forget_password_page_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/person_detail_page/bindings/person_detail_page_binding.dart';
import '../modules/person_detail_page/views/person_detail_page_view.dart';
import '../modules/persons_page/bindings/persons_page_binding.dart';
import '../modules/persons_page/views/persons_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/register_page/bindings/register_page_binding.dart';
import '../modules/register_page/views/register_page_view.dart';
import '../modules/reset_password_page/bindings/reset_password_page_binding.dart';
import '../modules/reset_password_page/views/reset_password_page_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_PAGE,
      page: () => const ResetPasswordPageView(),
      binding: ResetPasswordPageBinding(),
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
    GetPage(
      name: _Paths.FORGET_PASSWORD_PAGE,
      page: () => const ForgetPasswordPageView(),
      binding: ForgetPasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PERSON_DETAILS_PAGE,
      page: () => const AddPersonDetailsPageView(),
      binding: AddPersonDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TRANSACTION_PAGE,
      page: () => const AddTransactionPageView(),
      binding: AddTransactionPageBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAIL_PAGE,
      page: () => const BookDetailPageView(),
      binding: BookDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.PERSON_DETAIL_PAGE,
      page: () => const PersonDetailPageView(),
      binding: PersonDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
  ];
}
