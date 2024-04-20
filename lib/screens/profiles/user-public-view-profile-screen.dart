import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/profile-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/profile-header.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/screens/posts/public-post-screen.dart';
import 'package:nomo_app/screens/profiles/check-in-screen.dart';
import 'package:nomo_app/screens/profiles/own-profile-screen.dart';
import 'package:nomo_app/screens/profiles/profile-venues-screen.dart';

class UserPublicViewProfileScreen extends StatefulWidget {
  const UserPublicViewProfileScreen({super.key});

  @override
  State<UserPublicViewProfileScreen> createState() =>
      _UserPublicViewProfileScreenState();
}

class _UserPublicViewProfileScreenState
    extends State<UserPublicViewProfileScreen> {
  final ProfileTabController profileTabController =
      Get.put(ProfileTabController());

  final List<String> labels = [
    'Posts',
    'Venues',
    'Check-In & Out',
  ];

  final List<Widget> tabData = [
    const PublicPostScreen(),
    // ignore: prefer_const_constructors
    ProfileVenuesScreen(),
    const CheckInScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: height * .39,
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
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const OwnProfileViewScreen(
                                    initialTabIndex: 0,
                                  ));
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(Assets.follower3),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.zero,
                    //   alignment: Alignment.center,
                    //   height: 40.h,
                    //   width: Get.width,
                    //   decoration: const BoxDecoration(
                    //       gradient: AppColors.gradientColor),
                    //   child: AppBar(
                    //     leading: IconButton(
                    //         onPressed: () {
                    //           Get.back();
                    //         },
                    //         icon: SvgPicture.asset(Assets.arrowBack)),
                    //     systemOverlayStyle: const SystemUiOverlayStyle(
                    //         statusBarColor: Color(0xffD9D9D9)),
                    //     title: Text(
                    //       'Faz Sam',
                    //       style: TextStyle(
                    //           fontSize: 12.sp,
                    //           color: AppColors.white,
                    //           fontFamily: 'Montserrat',
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //     flexibleSpace: Container(
                    //       decoration: const BoxDecoration(
                    //           gradient: AppColors.gradientColor),
                    //     ),
                    //     // actions: actions,
                    //     // elevation: elevation,
                    //     actions: [
                    //       IconButton(
                    //           onPressed: () {},
                    //           icon: SvgPicture.asset(Assets.editProfileIcon)),
                    //       IconButton(
                    //           onPressed: () {
                    //             Get.to(() => SettingScreen());
                    //           },
                    //           icon: SvgPicture.asset(Assets.settings)),
                    //       10.horizontalSpace
                    //     ],
                    //   ),
                    // ),
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(top: height * .092),
                      child: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            const UserProfileHeader(),
                            _buildProfileButtons(),
                          ],
                        ),
                      ),
                    ),
                    // bottom: CustomProfileTab()
                    // ProfileTabBar(labels: labels)
                    // TabBar(
                    //   labelColor: const Color(0xff9CA3AF),
                    //   indicatorColor: AppColors.green,
                    //   indicatorWeight: 2,
                    //   indicatorSize: TabBarIndicatorSize.tab,
                    //   unselectedLabelColor: const Color(0xff9CA3AF),
                    //   // isScrollable: true,
                    //   automaticIndicatorColorAdjustment: true,
                    //   labelStyle: TextStyle(
                    //       fontSize: 11.sp,
                    //       fontFamily: 'Montserrat',
                    //       fontWeight: FontWeight.w600,
                    //       color: const Color(0xff9CA3AF)),
                    //   tabs: const [
                    //     Tab(text: 'Post'),
                    //     Tab(text: 'About'),
                    //     Tab(text: 'Check-In'),
                    //     Tab(text: 'Check-Out'),
                    //   ],
                    // ),
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
                  // _buildTabBar()
                  // TabBarView(children: tabData
                  //     // [
                  //     //   PublicPostScreen(),
                  //     //   Center(child: Text('About')),
                  //     //   CheckInScreen(),
                  //     //   CheckInScreen(),
                  //     // ],
                  //     ),
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
          const Expanded(child: PublicPostScreen()),
          const Expanded(child: ProfileVenuesScreen()),
          const Expanded(child: CheckInScreen()),
        ][profileTabController.currentIndex.value];
      },
    );
  }

  Widget _buildProfileButtons() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25.h, 0, 10.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: GradientElevatedButton(
                    gradient: AppColors.gradientColor,
                    label: 'Follow',
                    onPressed: () {},
                    width: 165.w),
              ),
            ),
            25.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: 45,
                child: GradientElevatedButton(
                    color: AppColors.blackColor,
                    label: 'Message',
                    onPressed: () {},
                    width: 165.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
