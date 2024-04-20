// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class GalleryTabButton extends StatelessWidget {
  String? title;
  bool isSelected;
  VoidCallback onTap;
  final int index;
  GalleryTabButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        // color: Colors.amber,
        height: 20.h,
        width: 100.w,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isSelected == true
                    ? AppColors.blackColor
                    : const Color(0xffADADAD)),
          ),
        ),
      ),
    );
  }
}
