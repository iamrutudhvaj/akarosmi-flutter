import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../data/model/response_model/list_of_book_user_response.dart';
import '../../../data/model/response_model/list_of_person_response.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/add_transaction_page_controller.dart';

class AddTransactionPageView extends GetView<AddTransactionPageController> {
  const AddTransactionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(
          controller.index != null ? "Update Transaction" : "Add Transaction",
          style: Styles.regular(
            20,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() => DropdownButtonFormField<BookData>(
                      isExpanded: true,
                      items: controller.appController.listOfBooks
                          .map<DropdownMenuItem<BookData>>((value) {
                        return DropdownMenuItem<BookData>(
                          value: value,
                          child: Text("${value.name}"),
                        );
                      }).toList(),
                      onChanged: (BookData? newValue) {
                        controller.selectedBook = newValue;
                      },
                      value: controller.selectedBook,
                      validator: (value) =>
                          value == null ? "Field Can't be empty" : null,
                      decoration: InputDecoration(
                        labelText: controller.appController.listOfBooks.isEmpty
                            ? 'No Book Available'
                            : 'Select Book',
                        hintText: 'Select Book',
                        labelStyle: TextStyle(color: AppColors.black),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() => DropdownButtonFormField<PersonData>(
                      isExpanded: true,
                      items: controller.appController.listOfPersonData
                          .map<DropdownMenuItem<PersonData>>((value) {
                        return DropdownMenuItem<PersonData>(
                          value: value,
                          child: Text("${value.firstName} ${value.lastName}"),
                        );
                      }).toList(),
                      onChanged: (PersonData? newValue) {
                        controller.selectedPerson = newValue;
                      },
                      value: controller.selectedPerson,
                      validator: (value) =>
                          value == null ? "Field Can't be empty" : null,
                      decoration: InputDecoration(
                        labelText:
                            controller.appController.listOfPersonData.isEmpty
                                ? 'No Person Available'
                                : 'Select Person',
                        hintText: 'Select Person',
                        labelStyle: TextStyle(color: AppColors.black),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormField(
                readonly: true,
                label: "Return Date",
                controller: controller.returnDateController,
                hintText: "Return Date",
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.primary,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Field Can't be empty";
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          dialogTheme: const DialogTheme(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          colorScheme: ColorScheme.light(
                            primary: AppColors.primary,
                            onPrimary: AppColors.white,
                            onSurface: AppColors.primary,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    controller.returnDateController.text = formattedDate;
                  } else {}
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  items: ["Available", "Allocated", "Away"]
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.selectedStatus = newValue;
                  },
                  value: controller.selectedStatus,
                  validator: (value) =>
                      value == null ? "Field Can't be empty" : null,
                  decoration: InputDecoration(
                    labelText: 'Select Book Status',
                    hintText: 'Select Book Status',
                    labelStyle: TextStyle(color: AppColors.black),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.transparent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                width: 170.w,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.index != null) {
                      controller.updateTransaction();
                    } else {
                      controller.insertTransaction();
                    }
                  }
                },
                child: Text(controller.index != null
                    ? "Update Transaction"
                    : "Add Transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
