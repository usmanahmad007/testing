// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/bottom-navBar-controller.dart';
import 'package:nomo_app/controllers/shared-index-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/bottom-sheet-screen.dart';
import 'package:nomo_app/screens/explore/explore.dart';
import 'package:nomo_app/screens/home-screen.dart';
import 'package:nomo_app/screens/notification/notification.dart';
import 'package:nomo_app/screens/profiles/profile-screen.dart';
import 'package:nomo_app/screens/venues/venues-custom-tab-screen.dart';

class CustomBottomScreen extends StatelessWidget {
  const CustomBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final SharedController sharedController = Get.find<SharedController>();

    BottomNavigationController controller =
        Get.put(BottomNavigationController());

    void _navigateToExploreScreen(BuildContext context) {
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ExploreScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ));
    }

    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (_) {
            return [
              const HomeScreen(),
              const BottomSheetScreeen(),
              const VenueCustomTabScreen(),
              const NotificationScreen(),
              const ProfileScreen(),
            ][controller.currentIndex.value];
          }),
      bottomNavigationBar: GetBuilder(
          init: controller,
          builder: (_) {
            return Obx(() {
              return SafeArea(
                child: Container(
                  // padding: EdgeInsets.only(bottom: 30.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: getColorBasedOnTab(
                          sharedController.selectedIndex.value),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.34),
                            blurRadius: 4,
                            offset: const Offset(0, -4))
                      ]),
                  height: height * .090,
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  width: 1.sw,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex = 0;
                              },
                              child: controller.currentIndex == 0
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return AppColors.gradientColor
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.home,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(Assets.home,
                                      color: getIconColorOnTab(sharedController
                                          .selectedIndex.value)),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex = 1;
                                // searchPlaces(context);
                                // _showBottomSheet(context);
                              },
                              child: controller.currentIndex == 1
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return AppColors.gradientColor
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.tabs,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(Assets.tabs,
                                      color: getIconColorOnTab(sharedController
                                          .selectedIndex.value)),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex = 2;
                              },
                              child: controller.currentIndex == 2
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return AppColors.gradientColor
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.location,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(Assets.location,
                                      color: getIconColorOnTab(sharedController
                                          .selectedIndex.value)),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex = 3;
                              },
                              child: controller.currentIndex == 3
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return AppColors.gradientColor
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.notification,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(Assets.notification,
                                      color: getIconColorOnTab(sharedController
                                          .selectedIndex.value)),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex = 4;
                              },
                              child: controller.currentIndex == 4
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return AppColors.gradientColor
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.profile,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(Assets.profile,
                                      color: getIconColorOnTab(sharedController
                                          .selectedIndex.value)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          }),
    );
  }

  Color getColorBasedOnTab(int tab) {
    switch (tab) {
      case 0:
        return AppColors.orangeColor;
      case 1:
        return AppColors.navBgColor;
      // ... other cases
      default:
        return const Color(0xff50555C);
    }
  }

  Color getIconColorOnTab(int tab) {
    switch (tab) {
      case 0:
        return AppColors.white;
      case 2:
        return AppColors.white;
      // ... other cases
      default:
        return AppColors.buttonBgColor;
    }
  }
}
