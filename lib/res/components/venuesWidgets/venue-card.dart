import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class VenueCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? asset;
  final Color? color;
  final String? status;
  const VenueCard(
      {super.key,
      this.title,
      this.subtitle,
      this.asset,
      this.color,
      this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, border: Border.all(color: color!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(asset!), fit: BoxFit.cover)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 20.w, 0),
                    alignment: Alignment.center,
                    // width: 40.h,
                    constraints:
                        const BoxConstraints(maxWidth: double.infinity),
                    height: 13.h,
                    color: color,
                    child: Text(
                      status!,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                5.verticalSpace,
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff595C68)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
