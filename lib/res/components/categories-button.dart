// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CategoriesButton extends StatelessWidget {
  var assets;
  final String? title;
  final Color? color;
  final VoidCallback onTap;
  CategoriesButton(
      {super.key,
      required this.assets,
      required this.title,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shadowColor: Colors.transparent,
                  shape: const CircleBorder(),
                  fixedSize: const Size(60, 60)),
              onPressed: onTap,
              child: Transform.scale(
                scale: 1.8,
                child: SvgPicture.asset(assets,
                    height: 50.h, width: 50.w, color: color),
              )),
          4.verticalSpace,
          Text(
            title!,
            textScaleFactor: 0.75,
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
