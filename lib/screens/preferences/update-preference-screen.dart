// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/preference-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/preferences/preferece-choose-location-screen.dart';

class UpdatePreferenceScreen extends StatefulWidget {
  const UpdatePreferenceScreen({super.key});

  @override
  State<UpdatePreferenceScreen> createState() => _UpdatePreferenceScreenState();
}

class _UpdatePreferenceScreenState extends State<UpdatePreferenceScreen> {
  List<String> tags = [];
  List<String> options = [
    'All',
    'Trending',
    'Casual Dining',
    'Fine Dining',
    'Coffee & Cakes',
    'Brunches',
    'Ladies Nights',
    'Sundowners',
    'Bars',
    'Lounges',
    'Clubs',
    'Sports',
    'Pets',
    'Outdoors',
    'Retail',
    'Family',
    'Grooming',
    'Events'
  ];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Preferences',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.preferences,
                  color: AppColors.white,
                )),
            10.horizontalSpace
          ],
        ),
        body: GetBuilder(
            init: PreferencesController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SearchFieldWidget(
                          preffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.search,
                                color: AppColors.blackColor,
                              )),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.voiceIcon,
                                color: AppColors.blackColor,
                              )),
                          hintText: 'Search for Preferences'),
                      30.verticalSpace,
                      Wrap(
                        spacing: 12.w,
                        children: options.map((String option) {
                          return Obx(() => Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    child: ChoiceChip(
                                      showCheckmark: false,
                                      label: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 5.h),
                                        child: Text(
                                          option,
                                          textScaleFactor: 0.9,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                      selected: controller.selectedOptions
                                          .contains(option),
                                      onSelected: (bool selected) {
                                        controller.toggleOption(option);
                                      },
                                      selectedColor: const Color(
                                          0xff439422), // Color when selected
                                      backgroundColor: AppColors
                                          .white, // Color when not selected
                                      labelStyle: TextStyle(
                                        color: controller.selectedOptions
                                                .contains(option)
                                            ? AppColors.white
                                            : AppColors.blackColor,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        side: BorderSide(
                                          color: controller.selectedOptions
                                                  .contains(option)
                                              ? const Color(0xff439422)
                                              : const Color(0xffCDCDCD),
                                          width: 2,
                                        ),
                                      ),
                                      checkmarkColor: Colors.white,
                                    ),
                                  ),
                                  if (controller.selectedOptions
                                      .contains(option))
                                    Positioned(
                                      right: 2,
                                      top: 0,
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 16.h, // Adjust size as needed
                                      ),
                                    ),
                                ],
                              ));
                        }).toList(),
                      ),
                      40.verticalSpace,
                      GradientElevatedButton(
                          gradient: AppColors.gradientColor,
                          label: 'Update',
                          onPressed: () {
                            // Get.offAllNamed(AppRoutes.prefLocation);
                            Get.to(
                              () => const PreferenceLocationScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 400),
                            );
                          },
                          width: 300.w)
                    ],
                  ),
                ),
              );
            }));
  }
}
