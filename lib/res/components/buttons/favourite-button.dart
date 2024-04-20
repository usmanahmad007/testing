// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class FavButton extends StatelessWidget {
  // var width;
  final String? text;
  var icon;
  final VoidCallback? onTap;
  FavButton(
      {super.key,
      // this.width = 80,
      required this.text,
      // this.color = AppColors.blueColor,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      decoration: BoxDecoration(
        gradient: AppColors.gradientColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            icon,
            5.horizontalSpace,
            // Icon(
            //   Icons.add,
            //   color: AppColors.white,
            //   size: 10.h,
            // ),
            // 5.horizontalSpace,
            Text(
              text!,
              textScaleFactor: 0.9,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}
