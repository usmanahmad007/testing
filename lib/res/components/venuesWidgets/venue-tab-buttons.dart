import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class VenueTabButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final int index;
  final bool? isSelected;

  const VenueTabButton(
      {super.key,
      this.onTap,
      this.title,
      required this.index,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        alignment: Alignment.center,
        height: 26.h,
        width: 110.w,
        decoration: BoxDecoration(
            gradient: isSelected!
                ? AppColors.gradientColor
                : const LinearGradient(colors: [
                    Color(0xffE8E8E8),
                    Color(0xffE8E8E8),
                  ]),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: isSelected! ? AppColors.white : AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
