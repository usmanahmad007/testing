import 'package:get/get.dart';

class CustomTabController extends GetxController {
  RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  set setCurrentIndex(int val) {
    _currentIndex.value = val;

    update();
  }

  var isHide = true.obs;

  void toggleVisibility() {
    isHide.value = !isHide.value;
  }
}
