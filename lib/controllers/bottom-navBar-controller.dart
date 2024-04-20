import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = RxInt(0);

  set setCurrentIndex(int val) {
    currentIndex.value = val;
    update();
  }
}
