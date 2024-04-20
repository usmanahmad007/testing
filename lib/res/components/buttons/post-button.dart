// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class PostButton extends StatelessWidget {
  var width;
  final String? text;
  // final Color? color;
  final VoidCallback? onTap;
  PostButton(
      {super.key,
      this.width = 80,
      required this.text,
      // this.color = AppColors.blueColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: width,
      decoration: BoxDecoration(
        // color: color,
        gradient: AppColors.gradientColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          text!,
          // textScaleFactor: 0.9,
          style: TextStyle(
              // letterSpacing: 0.5,
              fontSize: 12.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
