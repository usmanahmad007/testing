import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Initialize selectedGender and selectPreference with null or a default value.
  String? selectedGender;
  RxString selectedPreference = 'Option 1'.obs; // Default value

  final List<String> preferenceOptions = ['Option 1', 'Option 2', 'Option 3'];

  final List<String> preference = ['Select Prefernces', 'Option 2', 'Option 3'];

  void selectPreferenceIndex(String? value) {
    if (value != null) {
      selectedPreference.value = value;
    }
  }

  void selectGenderIndex(String? value) {
    selectedGender = value;
    update();
  }
}

// @override
// void onInit() {
//   super.onInit();
//   // Initialize selectPreference with a default value from preferenceOptions.
//   // Ensure this default value exists in your dropdown items.
//   selectPreference = preferenceOptions.first;
// }


  // void selectPreferenceIndex(String? value) {
  //   // Before setting the value, check if it exists in the preferenceOptions.
  //   if (preferenceOptions.contains(value)) {
  //     selectPreference = value;
  //     update();
  //   }
  // }

