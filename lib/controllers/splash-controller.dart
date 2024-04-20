import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/screens/intro-screen.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? controller;

  @override
  void onInit() {
    super.onInit();

    controller = VideoPlayerController.asset(Assets.splashVideo)
      ..initialize().then((_) {
        update();
        controller!.play();
        controller!.addListener(_videoEndListener);
      }).catchError((error) {
        print('Error initializing video: $error');
      });
    ;
  }

  void _videoEndListener() {
    if (controller!.value.position >= controller!.value.duration) {
      // Navigate to the next screen
      Get.to(
        () => const IntroScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      ); // Adjust the route as needed
      // Optionally, remove the listener if you don't need it anymore
      controller!.removeListener(_videoEndListener);
    }
  }

  @override
  void onClose() {
    controller?.removeListener(_videoEndListener);
    if (controller != null && controller!.value.isInitialized) {
      controller!.dispose();
    }
    super.onClose();
  }
}
