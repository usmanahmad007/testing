import 'package:get/get.dart';

class DateTimeController extends GetxController {
  var selectedIndex = RxInt(-1);

  void setColor(int val) {
    selectedIndex.value = val;
  }

  var afternoonIndex = RxInt(-1);

  void setAfternoonColor(int val) {
    afternoonIndex.value = val;
  }

  var eveningIndex = RxInt(-1);

  void setEveningColor(int val) {
    eveningIndex.value = val;
  }

  var nightIndex = RxInt(-1);

  void setNightColor(int val) {
    nightIndex.value = val;
  }
}
