
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RagisterPageController extends GetxController {
  TextEditingController dobController = TextEditingController();
  var selectedGender = "".obs;
  var selectedDate = DateTime.now().obs;

  onChnageGender(var gender) {
    selectedGender.value = gender;
  }

  final _isSelectedCategory = true.obs;
  bool get isSelectedCategory => _isSelectedCategory.value;
  set isSelectedCategory(bool value) => _isSelectedCategory.value = value;

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  final List genderItem = [
    'Male',
    'Female',
    'Other',
  ];
}
