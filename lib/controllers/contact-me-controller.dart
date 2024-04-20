import 'package:get/get.dart';

class ContactMeController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var selectedIndex;

  onIndexChange(index) {
    selectedIndex = index;
    update();
  }
}
