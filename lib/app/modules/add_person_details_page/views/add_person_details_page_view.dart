import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/add_person_details_page_controller.dart';

class AddPersonDetailsPageView extends GetView<AddPersonDetailsPageController> {
  const AddPersonDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Add Person Details',
          style: Styles.normal(20, color: AppColors.black),
        ),
        backgroundColor: AppColors.white,
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                hintText: "First name",
                textInputType: TextInputType.name,
                label: "First name",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: "Last name",
                textInputType: TextInputType.name,
                label: "Last name",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: "Mobile Number",
                textInputType: TextInputType.number,
                maxLength: 10,
                label: "Mobile Number",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                label: "Email",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: "Reference",
                textInputType: TextInputType.name,
                label: "Reference",
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: PrimaryButton(
                  width: 150,
                  onPressed: () {},
                  child: const Text("Add Person"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
