import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/common-image-view.dart';
import 'package:nomo_app/screens/booking/listing/preview-listing.dart';

class AllVenues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListingTiles(
          avatarUrl: dummyImg4,
          houseName: 'Grand Mercure Hotel...',
          houseLocation: 'Dubai, United Arab Emirates',
          rent: '300',
          isApproved: index == 0 ? true : false,
          onTap: () => Get.to(
            () => PreviewListing(),
          ),
        );
      },
    );
  }
}

class ListingTiles extends StatelessWidget {
  ListingTiles({
    Key? key,
    required this.avatarUrl,
    required this.houseName,
    required this.houseLocation,
    required this.rent,
    required this.onTap,
    required this.isApproved,
  }) : super(key: key);
  final String avatarUrl, houseName, houseLocation, rent;
  final VoidCallback onTap;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 124,
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: AppColors.white),
        padding: EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CommonImageView(
                height: 110,
                width: 110,
                url: avatarUrl,
                radius: 8.0,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      houseName,
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesMap,
                          height: 16,
                        ),
                        5.horizontalSpace,
                        Text(
                          houseLocation,
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        isApproved
                            ? Image.asset(
                                Assets.imagesApproved,
                                height: 24,
                              )
                            : Image.asset(
                                Assets.imagesPending,
                                height: 24,
                              ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '\$$rent',
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '/night',
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
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
