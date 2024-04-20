import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/buttons/profile-buttons.dart';
import 'package:nomo_app/screens/profiles/followers-screen.dart';
import 'package:nomo_app/screens/profiles/following-screen.dart';
import 'package:nomo_app/screens/profiles/view-profile-pic-screen.dart';
import 'package:nomo_app/screens/storyScreen/stories-section.dart';
import 'package:nomo_app/screens/storyScreen/story-page-view.dart';

class UserProfileHeader extends StatefulWidget {
  const UserProfileHeader({super.key});

  @override
  State<UserProfileHeader> createState() => _UserProfileHeaderState();
}

class _UserProfileHeaderState extends State<UserProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.buttonBgColor,
              image: DecorationImage(
                  image: AssetImage(Assets.profileCover), fit: BoxFit.cover)),
        ),
        Positioned(
          top: 60.h,
          // left: 0.5.sw - 62.5.w,
          left: 22,
          right: 22,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100.h,
            width: 351.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xffF8F8F8)),
              child: Row(
                children: [
                  3.horizontalSpace,
                  GestureDetector(
                    onTap: () => _showPopupMenu(context),
                    child: CustomPaint(
                      painter: DottedBorder(numberOfStories: 1, spaceLength: 4),
                      child: Container(
                        height: 95,
                        width: 95,
                        margin: EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(Assets.userProfile),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Faz Sam',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FollowersButton(onTap: () {
                              Get.to(() => const FollowersScreen(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 400));
                            }),
                            10.horizontalSpace,
                            const VerticalDivider(
                              width: 20,
                              thickness: 6,
                              color: AppColors.blackColor,
                            ),
                            20.horizontalSpace,
                            FollowingButton(onTap: () {
                              Get.to(() => const FollowingScreen(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 400));
                            })
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    await showMenu(
        context: context,
        color: AppColors.white,
        shadowColor: AppColors.neutralGray.withOpacity(0.4),
        position: RelativeRect.fromLTRB(
          offset.dx + renderBox.size.width * .07,
          offset.dy + renderBox.size.height * 1.06,
          offset.dx + renderBox.size.width,
          offset.dy + renderBox.size.height * .9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        items: <PopupMenuEntry<dynamic>>[
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Get.to(() => const ViewProfilePicScreen(isOwnProfile: false));
              Navigator.pop(context);
            },
            child: Text(
              'View Profile',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            value: 'profile',
          ),
          PopupMenuDivider(
            height: 1,
          ),
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Get.to(() => const StoryPageView(isUserStoryOwner: false));
              Navigator.pop(context);
            },
            child: Text(
              'View Story',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            value: 'settings',
          ),
        ],
        elevation: 5);
  }
}
