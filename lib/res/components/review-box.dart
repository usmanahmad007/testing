import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/common-image-view.dart';

class ReviewBox extends StatelessWidget {
  const ReviewBox({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.postedTime,
    required this.feedback,
    required this.rating,
    required this.isVerified,
  }) : super(key: key);

  final String avatarUrl, name, postedTime, feedback;
  final double rating;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      height: 180,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.0,
          color: AppColors.kGreyColor2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CommonImageView(
                height: 48,
                width: 48,
                url: avatarUrl,
                radius: 100.0,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                        // isVerified
                        //     ? Image.asset(
                        //         // Assets.imagesVerified,
                        //         '',
                        //         height: 18,
                        //       )
                        //     : SizedBox(),
                        10.horizontalSpace,
                        Text(
                          postedTime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RatingBarIndicator(
                      rating: rating,
                      itemCount: 5,
                      itemSize: 16.0,
                      itemPadding: EdgeInsets.symmetric(
                        horizontal: 1.0,
                      ),
                      unratedColor: Colors.amber.shade100,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              feedback,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
