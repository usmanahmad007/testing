// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class GradientElevatedButton extends StatelessWidget {
  final String label;
  var width;
  var color;
  var gradient;

  final VoidCallback onPressed;

  GradientElevatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.width,
      this.gradient,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          gradient: gradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
