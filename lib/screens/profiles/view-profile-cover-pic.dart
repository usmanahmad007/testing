import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/profiles/change-pic-with-camera-screen.dart';
import 'package:image/image.dart' as imgLib;

class ViewProfileCoverPicScreen extends StatefulWidget {
  final bool isOwnProfile;
  final File? imageFile;
  const ViewProfileCoverPicScreen(
      {super.key, required this.isOwnProfile, this.imageFile});

  @override
  State<ViewProfileCoverPicScreen> createState() =>
      _ViewProfileCoverPicScreenState();
}

class _ViewProfileCoverPicScreenState extends State<ViewProfileCoverPicScreen> {
  imgLib.Image? _image;
  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final imageBytes = await widget.imageFile!.readAsBytes();
    setState(() {
      _image = imgLib.decodeImage(imageBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: GradientAppBar(
        title: 'View Cover Image',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.follower1),
          ),
          15.horizontalSpace
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.isOwnProfile) changeProfileButton(),
            50.verticalSpace,
            if (_image != null)
              Container(
                height: Get.height * .45,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(widget.imageFile!),
                        fit: BoxFit.cover)),
              )
            else
              Container(
                height: Get.height * .45,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.profileCover),
                        fit: BoxFit.cover)),
              )
          ],
        ),
      ),
    );
  }

  Widget changeProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 28.h,
        width: 165.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Get.to(() => const ChangeImageWithCamera(
                  pageType: 'coverPic',
                ));
          },
          child: const Text(
            'Change Cover Image',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }
}
