import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/venues/venue-detail-screen.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  int _selectedCameraIndex = 0;
  bool _isCallAnswered = false;

  @override
  void initState() {
    super.initState();
    // _initCamera();
  }

  void _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![_selectedCameraIndex],
        ResolutionPreset.max,
        enableAudio: false,
      );
      _cameraController!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    }
  }

  void _toggleCamera() {
    _selectedCameraIndex = _selectedCameraIndex == 0 ? 1 : 0;
    if (_cameraController != null) {
      if (_cameraController!.value.isStreamingImages) {
        _cameraController!.dispose();
      }
    }
    setState(() {
      _cameraController = null;
    });
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _answerCall() {
    setState(() {
      _isCallAnswered = true;
      _initCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Joe Doodle',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.search)),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.voiceIcon)),
          10.horizontalSpace
        ],
      ),
      body: Stack(
        children: <Widget>[
          _cameraController == null
              ? Image.asset(
                  Assets.grandHotel,
                  fit: BoxFit.cover,
                  height: double.infinity,
                )
              : CameraPreview(_cameraController!),
          !_isCallAnswered
              ? Container()
              : const Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Assets.follower3),
                    radius: 32,
                  ),
                ),
          // Positioned(
          //   right: 10,
          //   top: 10,
          //   child: FloatingActionButton(
          //     mini: true,
          //     child: Icon(Icons.switch_camera),
          //     onPressed: _toggleCamera,
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            left: 40,
            right: 20,
            child: const Text(
              'Grand Mercure Hotel and Residences Dubai Airport',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30.sp)),
                child: !_isCallAnswered
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: SvgPicture.asset(Assets.declineCall),
                          ),
                          IconButton(
                            onPressed: _answerCall,
                            icon: SvgPicture.asset(Assets.incommingCall),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.messageCall),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.videoCall),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => VenueDetailScreen());
                            },
                            icon: SvgPicture.asset(Assets.endCall),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.voiceCall),
                          ),
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
