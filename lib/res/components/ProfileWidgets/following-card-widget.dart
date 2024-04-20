import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/following-button.dart';

class FollowingCardWidget extends StatelessWidget {
  final String? name;
  final String? images;
  const FollowingCardWidget({super.key, this.name, this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(-1, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.green,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(Assets.follower3),
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Darrell Steward',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff09101D)),
                  ),
                  5.verticalSpace,
                  const Text(
                    '@darrell _stew',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff50555C)),
                  ),
                  5.verticalSpace,
                  const Text(
                    '10 Mutual Friends',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff50555C)),
                  ),
                ],
              ),
            ],
          ),
          FollowingButton(
            width: 90.h,
            text: 'Following',
            onTap: () {},
          )
        ],
      ),
    );
    // Container(
    //   margin: EdgeInsets.only(bottom: 10.h),
    //   padding: EdgeInsets.only(right: 10.w),
    //   height: 70.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       color: AppColors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black12.withOpacity(0.1),
    //           spreadRadius: 0,
    //           blurRadius: 3,
    //           offset: const Offset(0, 3),
    //         ),
    //       ],
    //       borderRadius: BorderRadius.circular(6.r),
    //       border: Border.all(
    //           color: const Color(0xffCDCDCD).withOpacity(0.5), width: 1)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Row(
    //         children: [
    //           Container(
    //               margin: EdgeInsets.only(right: 13.h),
    //               height: 70.h,
    //               width: 70.h,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(6.r),
    //                   bottomLeft: Radius.circular(6.r),
    //                 ),
    //                 image: DecorationImage(
    //                     image: AssetImage(images!), fit: BoxFit.cover),
    //               )),
    //           Text(
    //             name!,
    //             textScaleFactor: 0.8,
    //             style: TextStyle(
    //                 fontSize: 12.sp,
    //                 fontFamily: 'Montserrat',
    //                 fontWeight: FontWeight.w600,
    //                 color: const Color(0xff09101D)),
    //           ),
    //         ],
    //       ),
    //       Align(
    //           alignment: Alignment.centerRight,
    //           child: FollowingButton(
    //             width: 90.h,
    //             text: 'Following',
    //             onTap: () {},
    //           ))
    //     ],
    //   ),
    // );
  }
}
