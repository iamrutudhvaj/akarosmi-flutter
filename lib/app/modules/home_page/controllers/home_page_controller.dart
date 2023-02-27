import 'package:akarosmi/app/modules/books_page/controllers/books_page_controller.dart';
import 'package:akarosmi/app/modules/books_page/views/books_page_view.dart';
import 'package:akarosmi/app/modules/dashboard_page/views/dashboard_page_view.dart';
import 'package:akarosmi/app/modules/persons_page/controllers/persons_page_controller.dart';
import 'package:akarosmi/app/modules/persons_page/views/persons_page_view.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;
  set selectedTab(int value) => _selectedTab.value = value;

  void changeTabIndex(int index) {
    selectedTab = index;
  }

  final bookPageController = Get.find<BooksPageController>();
  final personPageController = Get.find<PersonsPageController>();

  List bodyPageViewList = [
    const DashboardPageView(),
    const BooksPageView(),
    const PersonsPageView(),
  ];
}
