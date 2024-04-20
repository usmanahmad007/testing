// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class BuyTicketButton extends StatelessWidget {
  var width;
  final String? text;
  // final Color? color;
  final VoidCallback? onTap;
  BuyTicketButton(
      {super.key,
      this.width = 80,
      required this.text,
      // this.color = AppColors.blueColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: width,
      decoration: BoxDecoration(
          // color: color,
          gradient: AppColors.gradientColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 30,
                offset: Offset(2, 3),
                color: Color(0xff449329).withOpacity(0.7))
          ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          text!,
          textScaleFactor: 0.9,
          style: TextStyle(
              // letterSpacing: 0.5,
              fontSize: 8.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
