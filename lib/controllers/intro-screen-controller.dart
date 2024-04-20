import 'package:get/get.dart';

class IntroScreenController extends GetxController {
  var currentPage = 0.obs;

  void changePage(int page) {
    currentPage.value = page;
  }
}
