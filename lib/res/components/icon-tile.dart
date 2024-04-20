import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

Wrap iconTile({
  String? icon,
  String? title,
}) {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      Image.asset(
        icon!,
        height: 16,
        color: AppColors.kGreyColor3,
      ),
      8.horizontalSpace,
      Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'Montserrat',
            color: AppColors.kGreyColor3,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}
