// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  var width;
  var color;
  var gradient;
  final String assets;

  final VoidCallback onPressed;

  CustomElevatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.width,
      this.gradient,
      this.color,
      required this.assets});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          gradient: gradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assets),
            17.horizontalSpace,
            Text(
              label,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 12.sp,
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
