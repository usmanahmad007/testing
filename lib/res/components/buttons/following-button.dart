// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class FollowingButton extends StatelessWidget {
  var width;
  final String? text;

  final VoidCallback? onTap;
  FollowingButton(
      {super.key, this.width = 80, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff50555C),
        borderRadius: BorderRadius.circular(8.0),
      ),
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
          'Following',
          style: TextStyle(
              fontSize: 11,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
