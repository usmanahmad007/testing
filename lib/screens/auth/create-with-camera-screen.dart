import 'dart:io';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/auth/select-gender-screen.dart';
// ignore: unused_import
import 'package:nomo_app/screens/storyScreen/view-camera-image-screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nomo_app/screens/auth/Next-Screen-pencil.dart';

class CreateWithCameraScreen extends StatefulWidget {
  const CreateWithCameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateWithCameraScreenState createState() => _CreateWithCameraScreenState();
}

class _CreateWithCameraScreenState extends State<CreateWithCameraScreen>
    with WidgetsBindingObserver {
  List<CameraDescription>? _cameras;
  CameraController? _controller;
  bool _isReady = false;
  int _currentCameraIndex = 1;
  bool _isPermissionDialogVisible = false;
  bool _isRotating = false;
  late int _secondsLeft;
  late Timer _countdownTimer;

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
    _checkPermissions();
    const oneSec = Duration(seconds: 1);
    int t=1;
    _countdownTimer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (t == 0) {
          timer.cancel();
          isTimerOff = true;
          _cancelCountdown();


        } else {
          setState((){
            --t;
          });
        }
      });
    });
  }

  Future<void> _checkPermissions() async {
    final cameraPermissionStatus = await Permission.camera.status;
    if (cameraPermissionStatus.isGranted) {
      _setUpCameras();
    } else {
      setState(() => _isPermissionDialogVisible = true);
      final requestedStatus = await Permission.camera.request();
      setState(() => _isPermissionDialogVisible = false);
      if (requestedStatus.isGranted) {
        _setUpCameras();
      } else {
        // Handle permission denied
      }
    }
  }

  Future<void> _setUpCameras() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _initializeCamera(_currentCameraIndex);
    }
  }

  Future<void> _initializeCamera(int cameraIndex) async {
    print("Initializing camera with index: $cameraIndex");
   // _controller?.dispose(); // Dispose if _controller is already initialized
    if (_cameras != null && _cameras!.isNotEmpty) {
      print("EMaan");
      _controller = CameraController(
        _cameras![cameraIndex], // Safe access to _cameras
        ResolutionPreset.ultraHigh,
        enableAudio:false,
      );
      print("EMaan1");


      try {

        await _controller!.initialize();
        print("EMaan2");

        if (mounted) {
          setState(() => _isReady = true);
        }
        print("EMaan3");

      } on CameraException catch (e) {
        print("Error initializing camera: $e");
      }
    } else {
      print("No cameras available.");
    }
  }
  void _swapCamera() async {
    if (_cameras != null && _cameras!.length > 1 && !_isRotating) {
      setState(() {
        _isRotating = true;
      });
      print("Egift1");


      setState(() {
        _currentCameraIndex = _currentCameraIndex == 0 ? 1 : 0;
      });
      print("Egift2");


      await _initializeCamera(_currentCameraIndex);
      print("Egift3");
      setState(() {
        _isRotating = false;
      });
    }
  }



  Future<String> takePicture() async {
    print("Egift12");
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
      _startCountdown(4);
      await Future.delayed(Duration(seconds: 4));
    } else {
      _cancelCountdown();
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
  void _startCountdown(int secondsLeft) {
    _secondsLeft = secondsLeft;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color(0x00ffffff),
      builder: (BuildContext context) {
        return CountdownDialog(secondsLeft: _secondsLeft);
      },
    );

    // Initialize _countdownTimer here
    const oneSec = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_secondsLeft == 0) {
          timer.cancel();
          Navigator.pop(context);
          isTimerOff = true;
          _cancelCountdown();
          takePicture();

        } else {
          setState((){
            --_secondsLeft;
          });
        }
      });
    });
  }

  void _cancelCountdown() {
    if (_countdownTimer.isActive) {
      _countdownTimer.cancel();
      Navigator.pop(context);
      isTimerOff = true;
    }
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    if (_controller != null && _controller!.value.isInitialized) {
     // _controller!.dispose();
    }
    _controller = null;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
     // _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera(_currentCameraIndex);
    }
  }

  Future<void> _cropImage(String sourcePath) async {

    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      cropStyle: CropStyle.circle,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: AppColors.white,
          toolbarWidgetColor: Colors.black,
          backgroundColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          cropFrameColor: AppColors.white,
          dimmedLayerColor: Colors.black.withOpacity(0.5),
        ),
        IOSUiSettings(
          // title: 'Crop Your Image',

          rotateButtonsHidden: false,
          aspectRatioPickerButtonHidden: false,
          resetButtonHidden: true,
          rotateClockwiseButtonHidden: false,
          aspectRatioLockEnabled: false,
          aspectRatioLockDimensionSwapEnabled: true,
          doneButtonTitle: 'Done',
          cancelButtonTitle: 'Cancel',
          resetAspectRatioEnabled: false,
          minimumAspectRatio: 1.0,
        ),
      ],
    );
    if (croppedFile != null) {
      _navigateToNextScreen(croppedFile);
    }
  }

  void _navigateToNextScreen(CroppedFile croppedFile) {
    final imageFile = File(croppedFile.path);
    Get.to(() => SelectGenderScreen(imageFile: imageFile));
  }

// ***** For Image Pick From Gallery *****
  final picker = ImagePicker();
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
    return _isPermissionDialogVisible
        ? const Center(child: CircularProgressIndicator())
        : _isReady
        ? Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          getBody(),
          getFooter(
            onTap: () async {
              if (!_isRotating) {
                final imagePath = await takePicture();
                _cropImage(imagePath);
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
                color: Color(0xffD9D9D9),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(Assets.cancel),
              ),
            ),
          ),
          if (_isRotating)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    )
        : getPermissionRequestUI();
  }

  Widget cameraPreview() {
    if (_controller != null && _controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: CameraPreview(_controller!),
      );
    } else {
      return Container(); // or any other placeholder widget
    }
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

  Widget getPermissionRequestUI() {
    return Scaffold(backgroundColor: Colors.white, body: Container());
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
                  const SizedBox(height: 32),
                  GestureDetector(
                      onTap: timerToggle,
                      child: SvgPicture.asset(
                        isTimerOff ? Assets.timer : Assets.timerOn,
                        height: 40,
                      )),
                  /*const SizedBox(height: 32),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => NextScreen()), // Replace with your next screen
                        );
                      },
                      child: SvgPicture.asset(
                        Assets.pencilIcon,
                        height: 40,
                      )),*/



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
                      _cropImage(imagePath);
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
                    onTap: _swapCamera,
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
class CountdownDialog extends StatefulWidget {
  final int secondsLeft;
  const CountdownDialog({Key? key, required this.secondsLeft}) : super(key: key);

  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  int _countdownSeconds = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    setState((){
      _countdownSeconds=widget.secondsLeft;
    });
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownSeconds > 1) {
          _countdownSeconds--;
        } else {
          _timer.cancel();
          Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(

        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$_countdownSeconds',
              style: TextStyle(fontSize: 48,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

