import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        backgroundColor: AppColors.white,
        elevation: 5,
        title: Text(
          "Books",
          style: Styles.regular(
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
      body: ListView(
        children: [
          Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.bookList.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      extentRatio: 0.27,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          icon: Icons.edit_document,
                        ),
                        SlidableAction(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          onPressed: (context) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      "Are you sure you want to delete ${controller.bookList[index]}?"),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                    MaterialButton(
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        controller.bookList.removeAt(index);
                                        Get.back();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: ListTile(title: Text(controller.bookList[index])),
                  );
                },
              ))
        ],
      ),
    );
  }
}
