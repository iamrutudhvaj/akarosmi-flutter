import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.personListData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Add Person',
          style: Styles.regular(22, color: AppColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_PERSON_DETAILS_PAGE);
            },
            icon: Icon(
              Icons.person_add,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
        elevation: 5,
      ),
      body: ListView(
        children: [
          Obx(() {
            if (controller.listOfPersonData.data == null) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listOfPersonData.data?.length,
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
                                      "Are you sure you want to delete ${(controller.listOfPersonData.data?[index].firstName)} ${(controller.listOfPersonData.data?[index].lastName)}?"),
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
                                        controller.deletePersonData(
                                            id: "${controller.listOfPersonData.data?[index].personId}");
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
                    child: ListTile(
                      leading: ClipOval(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNhM2nffNaGqZaLZ2JFTo31IRnciJ97h1NyQ&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        "${(controller.listOfPersonData.data?[index].firstName)} ${(controller.listOfPersonData.data?[index].lastName)}",
                        style: Styles.bold(18),
                      ),
                      subtitle: Text(
                        "${controller.listOfPersonData.data?[index].email}",
                        style: Styles.regular(18),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.listOfPersonData.data?[index].createdAt?.toString().substring(0, 10)}",
                            style: Styles.regular(16),
                          ),
                          Text(
                            "Time : ${controller.listOfPersonData.data?[index].createdAt?.toIso8601String().toString().substring(14, 19)}",
                            style: Styles.regular(16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          })
        ],
      ),
    );
  }
}
