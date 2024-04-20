import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/splash-controller.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    print('buildScreen');
    return Scaffold(
        body: SizedBox.expand(
            child: GetBuilder(
                init: VideoController(),
                builder: (videoController) {
                  var controller = videoController.controller;
                  return controller == null || !controller.value.isInitialized
                      ? Container()
                      : FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller.value.size.width,
                            height: controller.value.size.height,
                            child: VideoPlayer(controller),
                          ));
                })));
  }
}
