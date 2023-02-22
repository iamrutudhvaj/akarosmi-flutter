import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/books_page_controller.dart';

class BooksPageView extends GetView<BooksPageController> {
  const BooksPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Text(
          "Books",
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_BOOK_PAGE);
            },
            icon: Icon(
              Icons.add_box,
              color: AppColors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'BooksPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
