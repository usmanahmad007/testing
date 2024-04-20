import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/comment-widget.dart';
import 'package:nomo_app/res/components/ProfileWidgets/recents-bottom-widget.dart';
import 'package:nomo_app/screens/profiles/likes-screen.dart';

void showCommentBottomSheet(BuildContext context) {
  double screenHeight = MediaQuery.sizeOf(context).height;
  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/happy-pop.mp3'));
  }

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight * .87,
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const LikesScreen());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.likeIcon),
                              5.horizontalSpace,
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Liked by ',
                                    style: TextStyle(
                                        color: Color(0xff6F6E6E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                                TextSpan(
                                    text: 'Christa Lenz ',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                                const TextSpan(
                                    text: 'and ',
                                    style: TextStyle(
                                        color: Color(0xff6F6E6E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                                TextSpan(
                                    text: '12 others',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                              ])),
                              5.horizontalSpace,
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.blackColor,
                                size: 12.h,
                              )
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Comments',
                                style: TextStyle(
                                    color: Color(0xff111129),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat')),
                            InkWell(
                              onTap: () {
                                showRecentBottomSheet(context);
                              },
                              child: Row(
                                children: [
                                  const Text('Most Recent',
                                      style: TextStyle(
                                          color: Color(0xff111129),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat')),
                                  10.horizontalSpace,
                                  SvgPicture.asset(
                                    Assets.updown,
                                    height: 12.h,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CommentWdget(onTap: () {}),
                          CommentWdget(
                            onTap: () {},
                          ),
                          CommentWdget(
                            onTap: () {},
                          ),
                          CommentWdget(
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  )),
                  SafeArea(
                    child: Container(
                      // height: 93.h,
                      constraints:
                          const BoxConstraints(maxHeight: double.infinity),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12.w, 10.h, 10.h, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 35.h,
                                width: 36.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        color: AppColors.borderSideColor)),
                                child: const Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: AppColors.borderSideColor,
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                height: 43.64,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 3.h, horizontal: 20.w),
                                    fillColor:
                                        AppColors.blueBorderSide.withOpacity(0),
                                    filled: true,
                                    hintText: 'Write your comment... ',
                                    hintStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff111129),
                                        fontFamily: 'Montserrat'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: AppColors.blueBorderSide
                                              .withOpacity(0.2),
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: AppColors.blueBorderSide
                                              .withOpacity(0.2),
                                          width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: AppColors.blueBorderSide
                                              .withOpacity(0.2),
                                          width: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                                child: GestureDetector(
                              onTap: () async {
                                await playSound();
                              },
                              child: Icon(
                                Icons.send_rounded,
                                size: 30,
                                color: AppColors.green,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

void showRecentBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return const RecentsBottomWidget();
      });
}
