import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/daily-progerss.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 20.w, 10.h),
      // height: 200.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: AppColors.neutralGray.withOpacity(0.2))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Hours Schedule',
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Container(
                    height: 7,
                    width: 12,
                    decoration:
                        const BoxDecoration(gradient: AppColors.gradientColor),
                  ),
                  4.horizontalSpace,
                  Text(
                    'Open',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.sp,
                        color: AppColors.green,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 7,
                    width: 12,
                    decoration:
                        const BoxDecoration(color: AppColors.orangeColor),
                  ),
                  4.horizontalSpace,
                  Text(
                    'Busy',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.sp,
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 7,
                    width: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xff767676).withOpacity(0.2),
                    ),
                  ),
                  4.horizontalSpace,
                  Text(
                    'Close',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.sp,
                        color: const Color(0xff767676),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hoursText('7-8'),
                  10.verticalSpace,
                  hoursText('6-7'),
                  10.verticalSpace,
                  hoursText('9-10'),
                  10.verticalSpace,
                  hoursText('3-4'),
                  10.verticalSpace,
                  hoursText('5-6'),
                  10.verticalSpace,
                  hoursText('7-8'),
                  10.verticalSpace,
                  hoursText('7-8'),
                ],
              ),
              const DailyProgress(day: 'Monday'),
              const DailyProgress(day: 'Tuesday'),
              const DailyProgress(day: 'Wednesday'),
              const DailyProgress(day: 'Thrusday'),
              const DailyProgress(day: 'Friday'),
              const DailyProgress(day: 'Saturday'),
              const DailyProgress(day: 'Sunday'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget hoursText(String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10,
        color: Color(0xff767676),
        fontWeight: FontWeight.w600),
  );
}
