import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CategoriesCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? asset;
  final Color? color;
  final String? status;
  final VoidCallback onTap;
  const CategoriesCard(
      {super.key,
      this.title,
      this.subtitle,
      this.asset,
      this.color,
      this.status,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            color: AppColors.white,
            border: Border.all(color: color!)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                  ),
                  image: DecorationImage(
                      image: AssetImage(asset!), fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      alignment: Alignment.center,
                      // width: 40.h,
                      constraints:
                          const BoxConstraints(maxWidth: double.infinity),
                      height: 13.h,
                      color: color,
                      child: Text(
                        status!,
                        overflow: TextOverflow.ellipsis,
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
            // 5.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff202236)),
                  ),
                  2.verticalSpace,
                  Text(
                    subtitle!,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff595C68)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
