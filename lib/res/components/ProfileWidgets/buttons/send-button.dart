// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class SendButton extends StatelessWidget {
  final String label;
  final String icon;
  var width;
  var color;
  var gradient;

  final VoidCallback onPressed;

  SendButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.width,
      this.gradient,
      this.color,
      this.icon = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
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
            Text(
              label,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 13.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
            20.horizontalSpace,
            SvgPicture.asset(
              Assets.send,
              color: AppColors.white,
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
