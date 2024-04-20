import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/assets/assets.dart';

class ProfileCard extends StatelessWidget {
  final String? asset;
  final String? title;
  final VoidCallback? onTap;
  const ProfileCard({super.key, this.asset, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffF1F0F0),
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: const Color(0xffCDCDCD), width: 0.5)),
      child: ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            asset!,
            height: 16.h,
          ),
          title: Text(
            title!,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),
          ),
          trailing: SvgPicture.asset(Assets.down)),
    );
  }
}
