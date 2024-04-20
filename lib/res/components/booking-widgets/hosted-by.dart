import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/common-image-view.dart';

class HostedBy extends StatelessWidget {
  const HostedBy({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.totalReviews,
    required this.description,
    required this.eContactName,
    required this.eEmail,
    required this.ePhone,
    required this.isVerified,
    required this.rating,
  }) : super(key: key);
  final String avatarUrl,
      name,
      totalReviews,
      description,
      eContactName,
      eEmail,
      ePhone;

  final bool isVerified;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hosted by',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
        20.verticalSpace,
        Row(
          children: [
            CommonImageView(
              height: 48,
              width: 48,
              url: avatarUrl,
              radius: 100.0,
            ),
            const SizedBox(
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                      ),
                      // isVerified
                      //     ? Image.asset(
                      //         '',
                      //         height: 18,
                      //       )
                      //     : SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        itemCount: 5,
                        itemSize: 16.0,
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
                        '($totalReviews reviews)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500),
        ),
        8.verticalSpace,
        Text(
          'Emergency Contact',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
        10.verticalSpace,
        Row(
          children: [
            Text(
              'Contact Name: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            Text(
              eContactName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              'Email: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            Text(
              eEmail,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              'Phone ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ePhone,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // Container(height: 1, color: AppColors.kGreyColor2),
      ],
    );
  }
}
