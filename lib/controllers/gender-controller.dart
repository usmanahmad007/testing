import 'package:get/get.dart';

class GenderSelectionController extends GetxController {
  var selectedGender = RxnString();

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}
