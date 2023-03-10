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
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: Text(
          controller.index != null
              ? 'Edit Person Details'
              : 'Add Person Details',
          style: Styles.semiBold(
            20,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: controller.firstNameController,
                  hintText: "First name",
                  textInputType: TextInputType.name,
                  label: "First name",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter First Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: controller.lastNameController,
                  hintText: "Last name",
                  textInputType: TextInputType.name,
                  label: "Last name",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Last Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: controller.mobileNumberController,
                  hintText: "Mobile Number",
                  textInputType: TextInputType.number,
                  maxLength: 10,
                  label: "Mobile Number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Mobile Number";
                    } else if (!RegExp(
                            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                        .hasMatch(value)) {
                      return "Please Enter a Valid Phone Number";
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  label: "Email",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Email";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter Correct Email Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: controller.referenceController,
                  hintText: "Reference",
                  textInputType: TextInputType.name,
                  label: "Reference",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Reference";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: PrimaryButton(
                    width: 150,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.index != null) {
                          controller.editPerson();
                        } else {
                          controller.addPerson();
                        }
                      }
                    },
                    child: Text(controller.index != null
                        ? 'Edit Person'
                        : "Add Person"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
