// ignore_for_file: use_super_parameters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/screens/auth/create-with-camera-screen.dart';
import 'package:nomo_app/screens/auth/select-gender-screen.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () => Get.to(() => SelectGenderScreen(
                  imageFile: File(''),
                )),
            child: const Padding(
              padding: EdgeInsets.only(top: 20, right: 25),
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => Get.to(() => const CreateWithCameraScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400)),
                child: SvgPicture.asset(
                  Assets.userLogo,
                  height: 220,
                )),
            70.verticalSpace,
            const Text(
              'Create Your Profile',
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff0F172A),
                  fontWeight: FontWeight.w600),
            ),
            10.verticalSpace,
            const Text(
              'Use your camera to instantly create\n your Profile picture',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff768089),
                  fontWeight: FontWeight.w600),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      label: 'Continue',
                      onPressed: () {
                        Get.to(() => const CreateWithCameraScreen(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 400));
                      },
                      width: 200.w)),
            ),
          ],
        ),
      ),
    );
  }
}
