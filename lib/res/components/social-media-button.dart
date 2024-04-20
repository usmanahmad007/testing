// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class SocialMediaButton extends StatelessWidget {
  VoidCallback onTap;
  String? buttonText;
  String? buttonIcon;

  SocialMediaButton({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      splashColor: Colors.grey.shade100,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          border: Border.all(color: AppColors.neutralGray),
        ),
        height: 48,
        width: 160.w,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                buttonIcon!,
                height: 15.h,
              ),
              5.horizontalSpace,
              Text(
                buttonText!,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontFamily: 'Montserrat',
                ),
                textScaleFactor: 0.9,
              ),
            ],
          ),
        ),
      ),
    );

    // ElevatedButton(
    //   onPressed: onTap,
    //   style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
    //             backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //             overlayColor:
    //                 MaterialStateProperty.all<Color>(Colors.grey.shade200),
    //           ) ??
    //       ElevatedButton.styleFrom(
    //         foregroundColor: Colors.grey.shade400,
    //         backgroundColor: AppColors.white,
    //         side: const BorderSide(width: 1.5, color: AppColors.neutralGray),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10.r),
    //         ),
    //         fixedSize: Size(120.w, 35.h),
    //       ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SvgPicture.asset(
    //         buttonIcon!,
    //         height: 15.h,
    //       ),
    //       5.horizontalSpace,
    //       Expanded(
    //         flex: 4,
    //         child: Text(
    //           buttonText!,
    //           style: TextStyle(
    //             fontSize: 15.sp,
    //             color: AppColors.blackColor,
    //             fontWeight: FontWeight.w600,
    //             letterSpacing: 0.5,
    //             fontFamily: 'Montserrat-Regular',
    //           ),
    //           textScaleFactor: 0.8,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
