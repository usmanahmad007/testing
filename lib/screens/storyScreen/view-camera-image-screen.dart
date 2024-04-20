// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:image/image.dart' as imgLib;
import 'dart:io';
import 'dart:math' as math;

import 'package:nomo_app/res/components/dialogs/dialogs.dart';

class ViewCameraImageScreen extends StatefulWidget {
  final File imageFile;
  const ViewCameraImageScreen({super.key, required this.imageFile});

  @override
  State<ViewCameraImageScreen> createState() => _ViewCameraImageScreenState();
}

class _ViewCameraImageScreenState extends State<ViewCameraImageScreen> {
  final TextEditingController _controller = TextEditingController();
  late imgLib.Image image;
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _imageFile = widget.imageFile;
    final imageBytes = await _imageFile.readAsBytes();
    image = imgLib.decodeImage(imageBytes)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// Top Widget View
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(_imageFile), fit: BoxFit.cover)),
          ),
          topWidgetView(),
        ],
      ),
    );
  }

  /// Top Widget View
  Widget topWidgetView() {
    return Padding(
        padding: const EdgeInsets.only(
          top: 40,
          // bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  color: AppColors.blackColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        Assets.cancel,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _cropImage();
                          },
                          child: SvgPicture.asset(Assets.cameraCrop),
                        ),
                        const SizedBox(width: 32),
                        SvgPicture.asset(Assets.text),
                        const SizedBox(width: 32),
                        SvgPicture.asset(Assets.cameraEdit),
                        const SizedBox(width: 32),
                        SvgPicture.asset(Assets.sticker),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(right: 27),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: addStoryButton(onTap: () {
            //       showDialog(
            //           context: context,
            //           builder: (context) {
            //             return storyDialog();
            //           });
            //     }),
            //   ),
            // ),
            _buildReplyField()
          ],
        ));
  }

  Widget _buildReplyField() {
    return SafeArea(
      child: Container(
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Add an caption",
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 20, right: 10),
                    fillColor: AppColors.white,
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff50555C)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none)),
                onChanged: (value) {},
              ),
            ),
            10.horizontalSpace,
            Expanded(
                flex: 0,
                child: sendButton(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return storyDialog();
                        });
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget sendButton({
    required VoidCallback onTap,
  }) {
    return Container(
      height: 45,
      width: 91,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: AppColors.gradientColor),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 18, right: 12),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onTap,
          child: const Icon(Icons.check, color: Colors.white)),
    );
  }

// Add Story Button
  Widget addStoryButton({required VoidCallback onTap}) {
    return Container(
      height: 40,
      width: 134,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: AppColors.gradientColor),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 18, right: 12),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 3,
              child: Text(
                'Add Story',
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ),
            Expanded(
              child: Transform.rotate(
                angle: -35 * math.pi / 180,
                child: SvgPicture.asset(
                  Assets.send,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _cropImage() async {
    if (_imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _imageFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        final imageFile = File(croppedFile.path);
        setState(() {
          _imageFile = imageFile;
        });

      }
    }
  }
}
