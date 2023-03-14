import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../controllers/book_detail_page_controller.dart';

class BookDetailPageView extends GetView<BookDetailPageController> {
  const BookDetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(
          "Book Transaction Detail",
          style: Styles.semiBold(
            20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.listByBookId.isEmpty) {
          return controller.appController.dataLoadingProcess();
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getListByBookId();
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listByBookId.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${controller.listByBookId[index].status}",
                    style: Styles.bold(18),
                  ),
                  subtitle: Text(
                    "${controller.listByBookId[index].returnDate}",
                    style: Styles.regular(18),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
