// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/res/components/search-sheet-widget.dart';
import 'package:nomo_app/screens/preferences/update-preference-screen.dart';

class ExploreFindForm extends StatefulWidget {
  bool? isOnExplorePage;

  ExploreFindForm({
    super.key,
    this.isOnExplorePage = false,
  });

  @override
  State<ExploreFindForm> createState() => _ExploreFindFormState();
}

class _ExploreFindFormState extends State<ExploreFindForm> {
  bool? havePets = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        8.verticalSpace,
        exploreRow(),
        20.verticalSpace,
        SearchFieldWidget(
            onTap: () => searchPlaces(context),
            controller: controller,
            preffixIcon: GestureDetector(
              onTap: () {},
              child: Transform.scale(
                scale: 0.35,
                child: SvgPicture.asset(
                  Assets.search,
                  color: AppColors.blackColor,
                  height: 18,
                ),
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Transform.scale(
                scale: 0.4,
                child: SvgPicture.asset(
                  Assets.voiceIcon,
                  color: AppColors.blackColor,
                  height: 18,
                ),
              ),
            ),
            hintText: 'Search for Venues'),
      ],
    );
  }

  Widget exploreRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  alignment: Alignment.center,
                  height: 34.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffE8E8E8),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.branch,
                            height: 20,
                            color: AppColors.blackColor,
                          ),
                          5.horizontalSpace,
                          const Text(
                            'Branches',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0, right: 8, child: SvgPicture.asset(Assets.cancel))
              ],
            ),
            const Text(
              '+ 4 more',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: AppColors.blackColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Get.to(() => const UpdatePreferenceScreen());
          },
          child: Row(
            children: [
              SvgPicture.asset(Assets.preferences),
              5.horizontalSpace,
              const Text(
                'Change Preferences',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: AppColors.blackColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }
}
