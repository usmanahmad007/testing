import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/common-image-view.dart';

class VenueViewTiles extends StatelessWidget {
  VenueViewTiles({
    Key? key,
    required this.avatarUrl,
    required this.houseName,
    required this.houseLocation,
    required this.totalReviews,
    required this.rent,
    required this.rating,
    required this.onTap,
    this.showRentPrice = true,
    this.height,
    this.avatarSize,
  }) : super(key: key);
  final String avatarUrl, houseName, houseLocation, totalReviews, rent;
  final double rating;
  final VoidCallback onTap;
  bool? showRentPrice;
  double? height, avatarSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CommonImageView(
                height: avatarSize ?? 100,
                width: avatarSize ?? 100,
                url: avatarUrl,
                radius: 8.0,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // MyText(
                    //   text: '$houseName',
                    //   size: 14,
                    //   weight: FontWeight.w500,
                    // ),
                    Text(
                      '$houseName',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.h,
                        ),
                        Expanded(
                          child: Text(
                            houseLocation,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // MyText(
                          //   paddingLeft: 5,
                          //   text: '$houseLocation',
                          //   size: 10,
                          //   color: kGreyColor,
                          // ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemCount: 5,
                          itemSize: 12.0,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          unratedColor: Colors.amber.shade100,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          totalReviews,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    showRentPrice!
                        ? Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                '\$$rent',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '/night',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
