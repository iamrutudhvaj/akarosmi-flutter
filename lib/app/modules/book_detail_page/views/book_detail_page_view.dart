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
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          "Book Transaction Detail",
          style: Styles.regular(
            20,
            color: AppColors.black,
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
                  trailing: PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_document,
                              color: AppColors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Edit")
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: AppColors.red),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Delete")
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 40),
                    elevation: 2,
                    onSelected: (value) {
                      if (value == 1) {
                        // Get.toNamed(Routes.ADD_BOOK_PAGE, arguments: index);
                      } else if (value == 2) {
                        // Get.bottomSheet(
                        //   barrierColor: AppColors.black.withOpacity(0.3),
                        //   _BottomSheetView(index),
                        // );
                      }
                    },
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
