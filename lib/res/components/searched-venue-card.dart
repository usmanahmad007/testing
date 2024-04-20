import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class SearchedVenueCardWidget extends StatefulWidget {
  const SearchedVenueCardWidget({super.key});

  @override
  State<SearchedVenueCardWidget> createState() =>
      _SearchedVenueCardWidgetState();
}

class _SearchedVenueCardWidgetState extends State<SearchedVenueCardWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 8.h),
        constraints: const BoxConstraints(maxHeight: double.infinity),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xffCDCDCD).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: const Color(0xffCDCDCD).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, -3),
              ),
            ],
            border: Border.all(
                color: const Color(0xffCDCDCD).withOpacity(0.4), width: 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 16,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            Assets.foodImage,
                          ),
                        ),
                        8.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Grand Mercure Hotel...',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat')),
                            2.verticalSpace,
                            Text('Hotel',
                                style: TextStyle(
                                    color: const Color(0xff979797),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat')),
                            2.verticalSpace,
                            Row(
                              children: [
                                Text('Open Now ',
                                    style: TextStyle(
                                        color: const Color(0xff60AA2E),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Montserrat')),
                                4.horizontalSpace,
                                const Text('2.4 km',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.favorite_outlined,
                          size: 20.h,
                          color: isFavorite
                              ? AppColors.orangeColor
                              : const Color(0xffD9D9D9),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              SizedBox(
                height: 130.h,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5.w, 5.h),
                        height: 135.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(Assets.grandHotel),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.r)),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
