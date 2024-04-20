import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/profile-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/user-own-profile-hearder.dart';
import 'package:nomo_app/screens/messages/messages.dart';
import 'package:nomo_app/screens/posts/check-in-out-post-screen.dart';
import 'package:nomo_app/screens/posts/user-post-screen.dart';
import 'package:nomo_app/screens/profiles/edit-profile-screen.dart';
import 'package:nomo_app/screens/profiles/own-profile-venues-screen.dart';

import 'package:nomo_app/screens/storyScreen/stories-section.dart';

class OwnProfileViewScreen extends StatefulWidget {
  final int initialTabIndex;
  const OwnProfileViewScreen({super.key, required this.initialTabIndex});

  @override
  State<OwnProfileViewScreen> createState() => _OwnProfileViewScreenState();
}

class _OwnProfileViewScreenState extends State<OwnProfileViewScreen> {
  final ProfileTabController profileTabController =
      Get.put(ProfileTabController());

  final List<String> labels = [
    'Posts',
    'Venues',
    'Check-In & Out',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileTabController.setCurrentIndex = widget.initialTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: height * .378,
                    backgroundColor: AppColors.white,
                    floating: false,
                    pinned: true,
                    titleSpacing: 0.0,
                    title: Container(
                      height: height * .058,
                      padding: const EdgeInsets.only(
                        right: 15,
                      ),
                      width: Get.width,
                      // color: AppColors.white,
                      decoration: const BoxDecoration(
                          gradient: AppColors.gradientColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: AppColors.white,
                                  )),
                              20.horizontalSpace,
                              Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(() => const MessagesScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    Assets.msg,
                                    height: 20,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(Assets.settings))
                            ],
                          )
                        ],
                      ),
                    ),
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(top: height * .092),
                      child: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            const UserOwnProfileHeader(),
                            5.verticalSpace,
                            _buildProfileButtons(),
                            5.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  GetBuilder<ProfileTabController>(
                    init: ProfileTabController(),
                    builder: (controller) {
                      return Container(
                        padding: const EdgeInsets.only(top: 13, left: 10),
                        // height: 50,
                        constraints:
                            const BoxConstraints(maxHeight: double.infinity),
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 20, left: 20),

                        decoration: BoxDecoration(
                            color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.setCurrentIndex = i,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        margin: const EdgeInsets.only(
                                            right: 6, left: 6),
                                        decoration: BoxDecoration(
                                          color:
                                              controller.currentIndex.value == i
                                                  ? AppColors.blackColor
                                                  : AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          labels[i],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: controller
                                                          .currentIndex.value ==
                                                      i
                                                  ? Colors.white
                                                  : AppColors.blackColor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                      8.verticalSpace,
                                      Container(
                                          height: 3.5,
                                          width: 95,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.currentIndex.value ==
                                                        i
                                                    ? AppColors.green
                                                    : Colors.transparent,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.elliptical(
                                                        40, 20),
                                                    topRight: Radius.elliptical(
                                                        40, 20)),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            // if (i == 0)
                            const SizedBox(width: 12),
                          ],
                        ),
                      );
                    },
                  ),
                  _tabBarViews(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _tabBarViews() {
    return GetBuilder<ProfileTabController>(
      init: profileTabController,
      builder: (_) {
        return [
          const Expanded(child: UserPostScreen()),
          const Expanded(child: OwnProfileVenuesScreen()),
          const Expanded(child: CheckInOutPostScreen()),
        ][profileTabController.currentIndex.value];
      },
    );
  }

  Widget _buildProfileButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buttons(
              width: 200.0,
              label: 'Add or View Stories',
              gradient: AppColors.gradientColor,
              onPressed: () {
                Get.to(() => const StoriesSection());
              }),
          10.horizontalSpace,
          _editProfileButton(
              width: 150.0,
              label: 'Edit Profile',
              color: AppColors.blackColor,
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              }),
        ],
      ),
    );
  }

  Widget _buttons(
      {required final String label,
      var width,
      var color,
      var gradient,
      required VoidCallback onPressed}) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          gradient: gradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.addStory,
              height: 20,
            ),
            7.horizontalSpace,
            Text(
              label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editProfileButton(
      {required final String label,
      var width,
      var color,
      var gradient,
      required VoidCallback onPressed}) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          gradient: gradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SvgPicture.asset(
                Assets.editProfileIcon,
                height: 15,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
