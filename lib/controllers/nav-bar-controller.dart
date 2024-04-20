import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt currentIndex = RxInt(0);

  set setCurrentIndex(int val) {
    currentIndex.value = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
