import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';

class GalleryListItem extends StatelessWidget {
  const GalleryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80.h,
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                    image: AssetImage(Assets.royalVila), fit: BoxFit.cover)),
          ),
          8.verticalSpace,
          Text(
            'Hotel Views',
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
