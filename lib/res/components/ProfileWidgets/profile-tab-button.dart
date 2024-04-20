import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class ProfileTabButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final int index;
  final bool? isSelected;

  const ProfileTabButton(
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
        alignment: Alignment.center,
        height: 38.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: isSelected!
                ? const Color(0xff979797).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.verticalSpace,
            Expanded(
              flex: 2,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    color: const Color(0xff9CA3AF),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Divider(
                height: 7,
                thickness: 3,
                color: isSelected! ? AppColors.green : Colors.transparent,
                endIndent: 8,
                indent: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
