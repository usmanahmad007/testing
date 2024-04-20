import 'package:get/get.dart';

class PreferencesController extends GetxController {
  var selectedOptions = <String>[].obs;

  void toggleOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
  }
}
