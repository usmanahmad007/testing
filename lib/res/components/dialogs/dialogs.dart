import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/screens/auth/email-verification-screen.dart';
import 'package:nomo_app/screens/storyScreen/story-page-view.dart';

void showLocationDetails(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            bottom: 120.h,
            left: 0,
            right: 0,
            child: Dialog(
              alignment: Alignment.bottomCenter,
              // insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 110.h,
                width: 335,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 90.h,
                        width: 120.w,
                        margin:
                            const EdgeInsets.only(left: 6, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: AssetImage(Assets.resortImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nature Pure, Hotel',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    fontFamily: "Montserrat"),
                              ),
                              8.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(Assets.locationBlack),
                                  5.horizontalSpace,
                                  const Expanded(
                                    child: Text(
                                      'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Color(0xff6F6E6E),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: Color(0xffFFC107),
                                  ),
                                  3.horizontalSpace,
                                  const Text(
                                    '4.7',
                                    style: TextStyle(
                                        color: Color(0xff6F6E6E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat"),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// Add Story Dialog
Widget storyDialog() {
  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/happy-pop.mp3'));
  }

  return Dialog(
    backgroundColor: AppColors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 30),
      height: 304,
      width: 279,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Text(
              'Add to Your Story?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              'By adding to your Story, users will be able to view it an unlimited number of times for 24 hours. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: Color(0xff50555C),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Add',
                onPressed: () async {
                  await playSound();
                  Get.back();
                  Get.to(() => const StoryPageView(isUserStoryOwner: true));
                },
                width: double.infinity),
            const SizedBox(height: 10),
            GradientElevatedButton(
                color: AppColors.blackColor,
                label: 'Cancel',
                onPressed: () {
                  Get.back();
                },
                width: double.infinity),
          ],
        ),
      ),
    ),
  );
}

// Delete  Dialog
Widget deleteDialog() {
  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/delete-sound.mp3'));
  }

  return Dialog(
    backgroundColor: AppColors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 40),
      height: 264,
      width: 279,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const Text(
              'Are you Sure?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Delete',
                onPressed: () async {
                  await playSound();
                  Get.back();
                },
                width: double.infinity),
            const SizedBox(height: 20),
            GradientElevatedButton(
                color: AppColors.blackColor,
                label: 'Cancel',
                onPressed: () {
                  Get.back();
                },
                width: double.infinity),
          ],
        ),
      ),
    ),
  );
}

Widget emailVerifyDialog() {
  return Dialog(
    backgroundColor: AppColors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 30),
      height: 330,
      width: 289,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const Text(
              'Email Verification\n Require',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              'for update your password,\nplease verify your E-mail address',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Okay',
                onPressed: () {
                  Get.to(() =>
                      const EmailVerificationScreen(pageType: 'changePass'));
                },
                width: double.infinity),
            const SizedBox(height: 25),
            GradientElevatedButton(
                color: AppColors.blackColor,
                label: 'Cancel',
                onPressed: () {
                  Get.back();
                },
                width: double.infinity),
          ],
        ),
      ),
    ),
  );
}

// Logout
Widget logoutDialog() {
  return Dialog(
    backgroundColor: AppColors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      height: 320,
      width: 310,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const Text(
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  label: 'Yes',
                  onPressed: () {
                    Get.back();
                  },
                  width: double.infinity),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GradientElevatedButton(
                  color: AppColors.blackColor,
                  label: 'No',
                  onPressed: () {
                    Get.back();
                  },
                  width: double.infinity),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget ticketDialog() {
  return Dialog(
    backgroundColor: AppColors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 30),
      height: 243,
      width: 279,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const Text(
              'Ticket Created\n #8378573',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              'We will review your ticket and respond shortly. Thanks',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            20.verticalSpace,
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Okay',
                onPressed: () {
                  Get.back();
                },
                width: double.infinity),
          ],
        ),
      ),
    ),
  );
}
