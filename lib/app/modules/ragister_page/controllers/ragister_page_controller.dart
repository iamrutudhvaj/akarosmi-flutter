import 'package:date_time_field/date_time_field.dart';
import 'package:get/get.dart';

class RagisterPageController extends GetxController {
  DateEditingController dobController = DateEditingController();

  var selectedGender = "".obs;

  onChnageGender(var gender) {
    selectedGender.value = gender;
  }

  final _isselectedCategory = true.obs;
  bool get isselectedCategory => _isselectedCategory.value;
  set isselectedCategory(bool value) => _isselectedCategory.value = value;

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;
 
 
  final List genderItem = [
    'Male',
    'Female',
    'Other',
  ];
}
