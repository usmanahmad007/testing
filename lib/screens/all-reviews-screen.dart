import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/all-reviews-header.dart';
import 'package:nomo_app/res/components/booking-widgets/booking-bottom-bar.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({super.key});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BookingBottomBar(),
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Reviews',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ReviewsHeader(),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 15.h, bottom: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildReviews(),
                  buildReviews(),
                  buildReviews(),
                  buildReviews(),
                  buildReviews(),
                  buildReviews(),
                  buildReviews(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildReviews() {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(Assets.follower1),
          ),
          6.horizontalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 10.h),
              constraints: const BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yelena Belova',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff111129),
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  6.verticalSpace,
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 12,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.only(right: 6.w),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      Assets.ratingStar,
                      color: const Color(0xffFF8800),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  10.verticalSpace,
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa.',
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        color: Color(0xff111129),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
