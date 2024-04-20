import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/comment-bottom-sheet.dart';
import 'package:nomo_app/res/components/ProfileWidgets/custom-post-buttons.dart';
import 'package:nomo_app/res/components/post-card-widget.dart';
import 'package:nomo_app/screens/posts/create-post-screen.dart';
import 'package:nomo_app/screens/profiles/likes-screen.dart';
import 'package:nomo_app/screens/profiles/user-public-view-profile-screen.dart';
import 'package:nomo_app/screens/storyScreen/stories-section.dart';

enum PostContentType { text, image }

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({super.key});

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  Future<void> playDeleteSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/delete-sound.mp3'));
  }

  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/multi-pop.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 60),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final contentType =
              index % 2 == 0 ? PostContentType.text : PostContentType.image;
          final content = contentType == PostContentType.text
              ? 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet consectetur adipiscing elit.Lorem ipsum dolor sit amet consectetur adipiscing elit.Lorem ipsum dolor sit amet consectetur adipiscing elit.'
              : Assets.royalVila;
          if (index == 0) {
            return _buildPostCreationField();
          }

          return postWidget(contentType, content);
        });
  }

  Widget _buildPostCreationField() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.w, 0, 10.h, 16),
      margin: EdgeInsets.only(bottom: 5.h, right: 10, top: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12.withOpacity(0.1),
          //     spreadRadius: 0,
          //     blurRadius: 3,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
          border: Border(
              bottom: BorderSide(
                  color: const Color(0xff50555C).withOpacity(0.18)))),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const UserPublicViewProfileScreen());
              },
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(
                  Assets.userProfile,
                ),
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            flex: 7,
            child: TextFormField(
              onTap: () {
                Get.to(() => const CreatePostScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400));
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                fillColor: AppColors.white,
                filled: true,
                hintText: 'Write on your mind? ...... ',
                hintStyle: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff232C2E),
                    fontFamily: 'inter'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color: const Color(0xffADADAD).withOpacity(0.5),
                      width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color: const Color(0xffADADAD).withOpacity(0.5),
                      width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color: const Color(0xffADADAD).withOpacity(0.5),
                      width: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget postWidget(PostContentType contentType, String content) {
    Widget postContentWidget;
    switch (contentType) {
      case PostContentType.text:
        postContentWidget = Text(content,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Color(0xff6F6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w600));

        break;
      case PostContentType.image:
        postContentWidget = ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(content,
                fit: BoxFit.cover, height: 180, width: double.infinity));
        break;
    }
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            // height: 200.h,
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0.h),
            constraints: const BoxConstraints(maxHeight: double.infinity),
            width: double.infinity,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(15.r),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                color: AppColors.white,
                border: Border(
                    left: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1),
                    right: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1),
                    top: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 16,
                        child: Row(
                          children: [
                            CustomPaint(
                              painter: DottedBorder(
                                  numberOfStories: 4, spaceLength: 4),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: onProfileImageClicked,
                                  child: const CircleAvatar(
                                    radius: 22,
                                    backgroundImage: AssetImage(
                                      Assets.userProfile,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            8.horizontalSpace,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Faz Sam ',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                                3.verticalSpace,
                                Row(
                                  children: [
                                    const Text('5 May, 2023',
                                        style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat')),
                                    4.horizontalSpace,
                                    SvgPicture.asset(Assets.worldIcon)
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            popupMenuTheme: PopupMenuThemeData(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: AppColors.neutralGray, width: 0.5),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 0.5,
                            ),
                          ),
                          child: PopupMenuButton(
                            padding: EdgeInsets.zero,
                            color: AppColors.white,
                            icon: const Icon(Icons.more_vert,
                                color: AppColors.blackColor),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  onTap: () async {
                                    await playDeleteSound();
                                  },
                                  value: 'delete',
                                  child: Container(
                                    height: 43,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        gradient: AppColors.gradientColor),
                                    child: const Center(
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ];
                            },
                            onSelected: (String value) {
                              print('You Click on pop up menu item');
                            },
                          ),
                        ),
                      )
                      // const Expanded(child: Icon(Icons.more_vert))
                    ],
                  ),
                  8.verticalSpace,
                  Text('Grand Mercure Hotel...',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  2.verticalSpace,
                  postContentWidget,
                ],
              ),
            ),
          ),
          Container(
              // height: Get.height * .08,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10),
              padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 10.h),
              constraints: const BoxConstraints(maxHeight: double.infinity),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
                border: Border(
                    left: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1),
                    right: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1),
                    top: BorderSide(
                        color: const Color(0xffCDCDCD).withOpacity(0.2),
                        width: 1)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffCDCDCD).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                  BoxShadow(
                    color: const Color(0xffCDCDCD).withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  7.verticalSpace,
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
                  4.verticalSpace,
                  const Divider(
                    color: Color(0xffEDEFEF),
                    thickness: 2,
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LikeButton(onTap: () async {
                        await playSound();
                        Get.to(() => const LikesScreen(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 400));
                      }),
                      50.horizontalSpace,
                      CommentButton(onTap: () {
                        showCommentBottomSheet(context);
                      })
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
