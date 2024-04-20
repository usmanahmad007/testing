import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/venues/venue-detail-screen.dart';

class VenueHeaderWidget extends StatefulWidget {
  const VenueHeaderWidget({super.key});

  @override
  State<VenueHeaderWidget> createState() => _VenueHeaderWidgetState();
}

class _VenueHeaderWidgetState extends State<VenueHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        Get.to(() => const VenueDetailScreen());
      },
      child: Container(
        height: 170.h,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage(Assets.grandHotel), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50.h,
                    height: 14.h,
                    color: AppColors.orangeColor,
                    child: Text(
                      'Busy',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: SvgPicture.asset(
                      Assets.favourite,
                      height: 20.h,
                      color: const Color(0xffD9D9D9),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.w, 8, 8.w, 8.w),
              // height: 60,
              constraints: const BoxConstraints(maxHeight: double.infinity),
              alignment: Alignment.center,
              width: width,
              decoration:
                  BoxDecoration(color: AppColors.blackColor.withOpacity(0.7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grand Mercure Hotel and Residences...',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        5.verticalSpace,
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '696K  ',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white)),
                              TextSpan(
                                  text: 'IDR / Night',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 24.h,
                      constraints:
                          const BoxConstraints(maxWidth: double.infinity),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: AppColors.gradientColor),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => const VenueDetailScreen());
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'View Venue',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 9.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
