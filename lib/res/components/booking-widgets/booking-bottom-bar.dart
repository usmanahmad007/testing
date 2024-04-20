import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/screens/calling/video-call-screen.dart';
import 'package:nomo_app/screens/messages/chat-room-screen.dart';
import 'package:nomo_app/screens/messages/messages.dart';

class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Container(
        height: height * .080,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GradientElevatedButton(
                    gradient: AppColors.gradientColor,
                    label: 'Make Booking',
                    onPressed: () {
                      Get.to(() => ChatScreen());
                    },
                    width: width),
              ),
              8.horizontalSpace,
              Expanded(
                flex: 0,
                child: InkWell(
                  onTap: () {
                    Get.to(() => MessagesScreen());
                  },
                  child: Container(
                    height: 35.h,
                    width: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.borderSideColor)),
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        Assets.inbox,
                        color: AppColors.blackColor,
                        height: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              Expanded(
                flex: 0,
                child: InkWell(
                  onTap: () {
                    Get.to(() => VideoCallScreen());
                  },
                  child: Container(
                    height: 35.h,
                    width: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.borderSideColor)),
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
