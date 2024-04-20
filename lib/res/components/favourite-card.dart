import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/venues/venue-detail-screen.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const VenueDetailScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 400));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Card(
          elevation: 3,
          color: AppColors.white,
          child: Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              // boxShadow: [
              //   BoxShadow(
              //       offset: Offset(0, 4),
              //       spreadRadius: 5,
              //       blurRadius: 15,
              //       color: Colors.grey.shade200)
              // ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    height: 170.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.r),
                            topLeft: Radius.circular(5.r)),
                        image: const DecorationImage(
                            image: AssetImage(Assets.grandHotel),
                            fit: BoxFit.cover)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50.h,
                          height: 17.h,
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Container(
                    height: 110.h,
                    padding: EdgeInsets.all(8.h),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grand Mercure Hotel and Residences...',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: 10,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.only(right: 1.w),
                              itemBuilder: (context, _) => SvgPicture.asset(
                                Assets.ratingStar,
                                color: const Color(0xffFF8800),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            4.horizontalSpace,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '5.0  ',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor)),
                                  TextSpan(
                                      text: 'Rating',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffADADAD))),
                                ],
                              ),
                            ),
                            30.horizontalSpace,
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 15,
                                  color: Color(0xffADADAD),
                                ),
                                4.horizontalSpace,
                                Text(
                                  '43.7 Km',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '696K  ',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor)),
                                  TextSpan(
                                      text: 'IDR / Night',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffADADAD))),
                                ],
                              ),
                            ),
                            Container(
                              height: 32.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  gradient: AppColors.gradientColor),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(() => const VenueDetailScreen(),
                                      transition: Transition.fadeIn,
                                      duration:
                                          const Duration(milliseconds: 400));
                                },
                                child: Text(
                                  'View Venue',
                                  textScaleFactor: 0.9,
                                  style: TextStyle(
                                      // letterSpacing: 0.5,
                                      fontSize: 10.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
