import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notifications = {
    'Booking': true.obs,
    'Reviews': false.obs,
    'Posts': false.obs,
    'Likes and Comments': true.obs,
    'Following and Followers': true.obs,
    'Stories': false.obs,
    'Messages': false.obs,
    'Audio Call': false.obs,
    'Video Call': false.obs,
  }.obs;
  var pauseAll = false.obs;

  void toggleAllNotifications(bool value) {
    pauseAll(value);
    if (pauseAll.isTrue) {
      notifications.forEach((key, value) {
        notifications[key]!(false);
      });
    }
  }
}
