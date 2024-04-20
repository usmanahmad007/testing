import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/add-review-dialog.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/settings/notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Notifications',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationSettings());
              },
              icon: SvgPicture.asset(Assets.settings)),
          8.horizontalSpace,
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        children: [
          // const DateHeader(date: 'Today'),
          const NotificationTile(
            asset: Assets.locationPin,
            message: 'Your Venue has been Approved and Published',
            time: 'May 2nd, 2022',
          ),

          12.verticalSpace,
          const NotificationTile(
            icon: Assets.starIcon,
            asset: null,
            message: 'Reviews: Your feedback matters. Share your experience.',
            time: 'May 2nd, 2022',
            useIcon: false,
          ),
          12.verticalSpace,
          // const DateHeader(date: 'Yesterday'),
          const NotificationTile(
            icon: Assets.bookingIcon,
            asset: null,
            message: 'Booking: Your reservation is confirmed. Ready for you!',
            time: 'May 2nd, 2022',
            useIcon: false,
          ),
          12.verticalSpace,

          // const DateHeader(date: '11 Sep,2023'),
          // 12.verticalSpace,
          UserNotificationTile(
            message: 'john, cristiana and 6 other share new posts.',
            time: 'May 2nd, 2022',
          ),
          12.verticalSpace,
          UserNotificationTile(
            message: '___duakhan liked your story..',
            time: 'May 2nd, 2022',
          ),
          12.verticalSpace,
          UserNotificationTile(
            message: 'michele099 liked your comment: Amazing work ',
            time: 'May 2nd, 2022',
          ),
          12.verticalSpace,
          UserNotificationTile(
            message: 'Joe Doodle started following you.',
            time: 'May 2nd, 2022',
          ),
          12.verticalSpace,
          UserNotificationTile(
            message: '___duakhan added a new Venue.',
            time: 'May 2nd, 2022',
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}

class DateHeader extends StatelessWidget {
  final String date;

  const DateHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        date,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String? asset;
  final String? icon;
  final String message;
  final String time;
  final bool useIcon;

  const NotificationTile({
    super.key,
    required this.asset,
    required this.message,
    required this.time,
    this.useIcon = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      splashColor: Colors.transparent,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const ReviewDialog();
            });
      },
      child: Container(
        height: 98,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.neutralGray.withOpacity(0.3),
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                  spreadRadius: 0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            children: [
              5.horizontalSpace,
              if (useIcon && asset != null)
                SvgPicture.asset(
                  asset!,
                  height: 20.h,
                ),
              if (!useIcon)
                Container(
                  width: 49.33,
                  height: 49.33,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff439422)),
                  child: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      icon!,
                      height: 20,
                    ),
                  ),
                ),
              10.horizontalSpace,
              Expanded(
                flex: 3,
                child: Text(
                  message,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutralGray),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserNotificationTile extends StatelessWidget {
  final String message;
  final String time;

  UserNotificationTile({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.3),
                offset: const Offset(0, 3),
                blurRadius: 4,
                spreadRadius: 0)
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Row(
          children: [
            5.horizontalSpace,
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Assets.follower5),
            ),
            10.horizontalSpace,
            Expanded(
              flex: 3,
              child: Text(
                message,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralGray),
                  )),
            ),
          ],
        ),
      ),
      // ListTile(
      //   leading: Icon(iconData),
      //   title: Text(message),
      //   subtitle: Text(time),
      //   // Add additional styling
      // ),
    );
  }
}
