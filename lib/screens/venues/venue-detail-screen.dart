// ignore_for_file: non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/dropdown-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/booking-widgets/booking-bottom-bar.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/buttons/favourite-button.dart';
import 'package:nomo_app/res/components/buttons/follow-button-widget.dart';
import 'package:nomo_app/res/components/gallery/gallery-list-card.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/progess-card.dart';
import 'package:nomo_app/screens/all-reviews-screen.dart';
import 'package:nomo_app/screens/gallery/gallery-tabbar.dart';
import 'package:nomo_app/screens/profiles/location-card.dart';
import 'package:nomo_app/screens/venues/select-date-time-screen.dart';

enum FavouriteState { initial, isFavourite }

class VenueDetailScreen extends StatefulWidget {
  const VenueDetailScreen({super.key});

  @override
  State<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  final DropdownController dropdownController = Get.put(DropdownController());
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  FavouriteState _favouriteState = FavouriteState.initial;

  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/multi-pop.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const BookingBottomBar(),
      appBar: GradientAppBar(
        title: 'Grand Mercure Hotel...',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .28,
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.grandHotel), fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Grand Mercure Hotel and Residences Dubai Airport',
                              maxLines: 2,
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
                                  ignoreGestures: true,
                                  itemPadding: EdgeInsets.only(right: 1.w),
                                  itemBuilder: (context, _) => SvgPicture.asset(
                                    Assets.ratingStar,
                                    color: const Color(0xffFF8800),
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                7.horizontalSpace,
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '5.0  ',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff1C1C1C))),
                                      TextSpan(
                                          text: 'Rating',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff1C1C1C))),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  '268 Reviews',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FollowButton(
                                width: 90.w, text: 'Follow', onTap: () {}),
                            6.verticalSpace,
                            if (_favouriteState == FavouriteState.initial ||
                                _favouriteState == FavouriteState.isFavourite)
                              FavButton(
                                  icon: SvgPicture.asset(
                                    Assets.favourite,
                                    color: _favouriteState ==
                                            FavouriteState.initial
                                        ? AppColors.white
                                        : AppColors.orangeColor,
                                  ),
                                  text:
                                      _favouriteState == FavouriteState.initial
                                          ? '+ Favourite'
                                          : '',
                                  onTap: () async {
                                    await playSound();
                                    setState(() {
                                      _favouriteState = _favouriteState ==
                                              FavouriteState.initial
                                          ? FavouriteState.isFavourite
                                          : FavouriteState.initial;
                                    });
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    'Bio',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis.',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  20.verticalSpace,
                  Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  const LocationCard(),
                  20.verticalSpace,
                  ReUseAbleRow(),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(5.h),
                    height: 120.h,
                    // constraints: BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const GalleryListItem();
                        }),
                  ),
                  20.verticalSpace,
                  const ProgressCard(),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(10.h),
                    height: 100.h,
                    // constraints: BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Date & Time',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          height: 43.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const DateTimeScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffCDCDCD), width: 2),
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 12.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Select',
                                    // dropdownController.selectedGender ??
                                    //     'Select Gender',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down,
                                      color: AppColors.blackColor),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(10.h),
                    height: 120.h,
                    // constraints: BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Venue Owner ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        17.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.green,
                                      width: 2,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage(Assets.follower1),
                                  ),
                                ),
                                14.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Darrell Steward',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff09101D)),
                                    ),
                                    5.verticalSpace,
                                    const Text(
                                      '@darrell _stew',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff50555C)),
                                    ),
                                    5.verticalSpace,
                                    const Text(
                                      '10 Mutual Friends',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff50555C)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            FollowButton(
                              width: 80.w,
                              text: 'Follow',
                              onTap: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  reviewLabelRow(),
                  30.verticalSpace,
                  Column(
                    children: [
                      buildReviews(),
                      buildReviews(),
                      buildReviews(),
                      buildReviews(),
                    ],
                  ),
                  20.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: GradientElevatedButton(
                        color: AppColors.blackColor,
                        label: 'See All Reviews',
                        onPressed: () {
                          Get.to(() => const AllReviewsScreen());
                        },
                        width: 170.w),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ReUseAbleRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Gallery',
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            maxLines: 2,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: () {
              Get.to(() => GalleryTabs());
            },
            child: Row(
              children: [
                Text(
                  'View All',
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                4.horizontalSpace,
                Icon(
                  Icons.arrow_forward,
                  size: 13.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewLabelRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Review (86)',
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            maxLines: 2,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              SvgPicture.asset(
                Assets.ratingStar,
                color: const Color(0xffFF8800),
                height: 12.h,
              ),
              4.horizontalSpace,
              Text(
                '4.7',
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
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
