import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/common-image-view.dart';

class CancelledTiles extends StatelessWidget {
  const CancelledTiles({
    Key? key,
    required this.avatarUrl,
    required this.houseName,
    required this.hostedBy,
    required this.onTap,
    required this.refundStatus,
  }) : super(key: key);
  final String avatarUrl, houseName, hostedBy, refundStatus;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.kGreyColor2.withOpacity(0.2),
                offset: Offset(0, 3),
                blurRadius: 4)
          ]),
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          children: [
            CommonImageView(
              height: 100,
              width: 100,
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
                  Text(
                    '$houseName',
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
                  Text(
                    '$hostedBy',
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
                    '$refundStatus',
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
            ),
          ],
        ),
      ),
    );
  }
}
