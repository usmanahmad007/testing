import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/ProfileWidgets/profile-card-widget.dart';
import 'package:nomo_app/screens/booking/booking.dart';
import 'package:nomo_app/screens/contact-screen.dart';
import 'package:nomo_app/screens/favourites-screen.dart';
import 'package:nomo_app/screens/preferences/update-preference-screen.dart';
import 'package:nomo_app/screens/privacy-policy-screen.dart';
import 'package:nomo_app/screens/profiles/own-profile-screen.dart';
import 'package:nomo_app/screens/profiles/personal-information-screen.dart';
import 'package:nomo_app/screens/settings/notifications.dart';
import 'package:nomo_app/screens/terms-and-conditions-screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Profile',
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return logoutDialog();
                    });
              },
              icon: SvgPicture.asset(Assets.logout)),
          10.horizontalSpace
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              profileHeader(),

              20.verticalSpace,
              ProfileCard(
                asset: Assets.profileIcon,
                title: 'Personal Information',
                onTap: () {
                  Get.to(() => const PersonalInfoScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),

              ProfileCard(
                asset: Assets.locationPin,
                title: 'My Venues',
                onTap: () {
                  // Get.to(() => VenueListing(),
                  Get.to(
                      () => const OwnProfileViewScreen(
                            initialTabIndex: 1,
                          ),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              ProfileCard(
                asset: Assets.booking,
                title: 'My Booking',
                onTap: () {
                  Get.to(() => const Booking());
                },
              ),
              ProfileCard(
                asset: Assets.favourite,
                title: 'Favourities',
                onTap: () {
                  Get.to(() => const FavouritesScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              ProfileCard(
                asset: Assets.checks,
                title: 'My Checks - In & Out',
                onTap: () {
                  Get.to(
                      () => const OwnProfileViewScreen(
                            initialTabIndex: 2,
                          ),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              ProfileCard(
                asset: Assets.preferences,
                title: 'Preferences',
                onTap: () {
                  Get.to(() => const UpdatePreferenceScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              ProfileCard(
                asset: Assets.notifyIcon,
                title: 'Notifications',
                onTap: () {
                  Get.to(() => const NotificationSettings());
                },
              ),
              // ProfileCard(
              //   asset: Assets.about,
              //   title: 'About App',
              //   onTap: () {},
              // ),
              profileHeadings('Help & Support'),
              10.verticalSpace,
              ProfileCard(
                asset: Assets.help,
                title: 'Get Help',
                onTap: () {
                  Get.to(() => const ContactUsScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),

              profileHeadings('Legal'),
              10.verticalSpace,
              ProfileCard(
                asset: Assets.note,
                title: 'Terms and Conditions',
                onTap: () {
                  Get.to(() => const TermsandConditionScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              ProfileCard(
                asset: Assets.note,
                title: 'Privacy Policy',
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 400));
                },
              ),
              const Divider(),
              20.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return logoutDialog();
                          });
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: AppColors.orangeColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.orangeColor,
                          decorationThickness: 2.0,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text profileHeadings(String heading) {
    return Text(
      heading,
      style: TextStyle(
          fontSize: 13.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600),
    );
  }

  Widget profileHeader() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.grey.shade100,
      onTap: () {
        Get.to(() => const OwnProfileViewScreen(initialTabIndex: 0),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 400));
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: AppColors.neutralGray.withOpacity(0.15),
                  offset: const Offset(0, 2)),
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: AppColors.neutralGray.withOpacity(0.15),
                  offset: const Offset(2, -2)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: const AssetImage(Assets.profileImage),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alexandria Forger',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff0D120E),
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Dubai, UAE',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Color(0xff0D120E),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Assets.down)),
            )
          ],
        ),
      ),
    );
  }
}
