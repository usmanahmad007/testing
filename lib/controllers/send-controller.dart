import 'package:get/get.dart';

class SendController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var storiesIndex;

  onStoriesIndexChange(index) {
    storiesIndex = index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  var bestFriendsIndex;

  onBestFriendsIndexChange(index) {
    bestFriendsIndex = index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  var recentIndex;

  onRecentIndexChange(index) {
    recentIndex = index;
    update();
  }
}
