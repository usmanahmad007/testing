import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/storyScreen/view-camera-image-screen.dart';

import '../select-emojy-screen.dart';

class EffectScreen extends StatefulWidget {
  const EffectScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EffectScreenState createState() => _EffectScreenState();
}

class _EffectScreenState extends State<EffectScreen>
    with WidgetsBindingObserver {
  List<CameraDescription>? _cameras;
  CameraController? _controller;
  bool _isReady = false;
  int _currentCameraIndex = 0;

  bool isFlashOff = true;

  void flashToggle() {
    setState(() {
      isFlashOff = !isFlashOff;
    });
  }

  bool isTimerOff = true;

  void timerToggle() {
    setState(() {
      isTimerOff = !isTimerOff;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setUpCameras();
  }

  Future<void> _setUpCameras() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      // Check for cameras availability
      _initializeCamera(_currentCameraIndex);
    }
  }

  Future<void> _initializeCamera(int cameraIndex) async {
    _controller?.dispose(); // Dispose if _controller is already initialized
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(
        _cameras![cameraIndex], // Safe access to _cameras
        ResolutionPreset.medium,
      );

      try {
        await _controller!.initialize();
        setState(() {
          _isReady = true;
        });
      } on CameraException catch (_) {
        print("Error initializing camera: $_");
      }
    }
  }

  void _swapCamera() {
    if (_cameras != null && _cameras!.length > 1) {
      _currentCameraIndex = _currentCameraIndex == 0 ? 1 : 0;
      _initializeCamera(_currentCameraIndex);
    }
  }

  Future<String> takePicture() async {
    print("Egift");
    if (_controller == null || !_controller!.value.isInitialized) {
      print('Error: Select a camera first.');
      return '';
    }

    if (isFlashOff == true) {
      await _controller?.setFlashMode(FlashMode.off);
    } else {
      await _controller?.setFlashMode(FlashMode.torch);
    }

    if (!isTimerOff) {
      // Add a delay if isTimerOff is false
      await Future.delayed(Duration(seconds: 3));
    }

    final XFile file = await _controller!.takePicture();

    // If flash mode is torch, set it off before returning the file path
    if (_controller?.value.flashMode == FlashMode.torch) {
      setState(() {
        _controller?.setFlashMode(FlashMode.off);
      });
    }

    return file.path;
  }
  /* void _swapCamera() {
     // Swap the camera index
     _currentCameraIndex = _currentCameraIndex == 0 ? 1 : 0;
     _initializeCamera(_currentCameraIndex);
   }*/

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize your camera here
      _initializeCamera(_currentCameraIndex);
    }
  }

// ***** For Image Pick From Gallery *****
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future<String> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {

      }
    });
    return pickedFile!.path;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   elevation: 0,
      //   systemOverlayStyle:
      //       const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(gradient: AppColors.gradientColor),
      //   ),
      //   leadingWidth: 70,
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: Transform.scale(
      //         scale: 0.5,
      //         child: SvgPicture.asset(
      //           Assets.cancel,
      //           color: AppColors.white,
      //           height: 30,
      //         ),
      //       )),
      //   title: InkWell(
      //     onTap: () {
      //       // Get.to(() => ProfileScreen());
      //     },
      //     child: const CircleAvatar(
      //       radius: 20,
      //       backgroundImage: AssetImage(Assets.follower7),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          getBody(),
          getFooter(
            onTap: () async {
              final imagePath = await takePicture();
              if (imagePath.isNotEmpty) {
                final imageFile = File(imagePath);

                Get.to(() => ViewCameraImageScreen(imageFile: imageFile));
              }
            },
          ),
          Positioned(
              top: 50,
              left: 20,
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xffD9D9D9), shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(Assets.cancel)))),
        ],
      ),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: CameraPreview(_controller!));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (_isReady == false ||
        _controller == null ||
        !_controller!.value.isInitialized) {
      return Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: size.width,
        height: size.height,
        child: const Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))),
      );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview()),
    );
  }

  Widget getBodyBK() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white),
      child: const Image(
        image: NetworkImage(
          "https://images.unsplash.com/photo-1582152629442-4a864303fb96?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2VsZmllfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getFooter({required VoidCallback onTap}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 50,
            margin: const EdgeInsets.only(top: 90, right: 20),
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(14)),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 20, top: 20, right: 13),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: flashToggle,
                      child: SvgPicture.asset(
                          isFlashOff ? Assets.flashOff : Assets.flashOn)),
                  // const SizedBox(height: 32),
                  // SvgPicture.asset(Assets.cameraEdit),
                  // const SizedBox(height: 32),
                  // SvgPicture.asset(Assets.sticker),
                  // const SizedBox(height: 32),
                  // InkWell(
                  //   onTap: () {},
                  //   child: SvgPicture.asset(Assets.cameraCrop),
                  // ),
                  const SizedBox(height: 32),
                  GestureDetector(
                      onTap: timerToggle,
                      child: SvgPicture.asset(
                        isTimerOff ? Assets.timer : Assets.timerOn,
                        height: 40,
                      )),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final imagePath = await getImageFromGallery();
                      if (imagePath.isNotEmpty) {
                        final imageFile = File(imagePath);

                        Get.to(() => ViewCameraImageScreen(imageFile: imageFile));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff171700).withOpacity(0.8)),
                      child: SvgPicture.asset(
                        Assets.storyGallery,
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: onTap,
                      child: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset(
                            Assets.storyCapture,
                          ))),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {

                       Get.to(() => const SelectEmojiScreen());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff171700).withOpacity(0.8)),
                      child: SvgPicture.asset(
                        Assets.rotateIcon,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
