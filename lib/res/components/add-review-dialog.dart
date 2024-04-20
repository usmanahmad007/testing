import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/screens/add-review-screen.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Container(
        height: 430,
        width: 329,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.verticalSpace,
              const Text(
                'Please leave a review on your recent Booking',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
              20.verticalSpace,
              buildCard(),
              18.verticalSpace,
              GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  width: 170.w,
                  label: 'Post Review',
                  onPressed: () {
                    Get.back();
                    Get.to(() => const AddReviewScreen());
                  }),
              8.verticalSpace,
              GradientElevatedButton(
                  color: AppColors.blackColor,
                  width: 170.w,
                  label: 'Cancel',
                  onPressed: () {
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      // height: 90.h,
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                color: AppColors.neutralGray.withOpacity(0.4),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 75.h,
              width: 95.w,
              margin: const EdgeInsets.only(left: 6, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage(Assets.resortImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nature Pure, Hotel',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: "Montserrat"),
                    ),
                    8.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(Assets.locationBlack),
                        // 5.horizontalSpace,
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: const Color(0xff6F6E6E),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFFC107),
                          size: 20,
                        ),
                        3.horizontalSpace,
                        Text(
                          '4.7',
                          style: TextStyle(
                              color: const Color(0xff6F6E6E),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
