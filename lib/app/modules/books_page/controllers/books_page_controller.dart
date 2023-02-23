import 'package:get/get.dart';

class BooksPageController extends GetxController {
  RxList<String> bookList = RxList<String>.empty(growable: true);

  @override
  void onInit() {
    bookList.addAll(
        ['abc', 'abcjh', 'bmbnj', 'hghjv', 'abc', 'abcjh', 'bmbnj', 'hghjv']);
    super.onInit();
  }
}
