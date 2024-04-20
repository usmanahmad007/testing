import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/post-card-widget.dart';
import 'package:nomo_app/screens/profiles/create-checkIn-out-screen.dart';

class CheckInOutPostScreen extends StatefulWidget {
  const CheckInOutPostScreen({super.key});

  @override
  State<CheckInOutPostScreen> createState() => _CheckInOutPostScreenState();
}

class _CheckInOutPostScreenState extends State<CheckInOutPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildCheckInOutPostCreationField();
                }

                return const PostCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInOutPostCreationField() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.w, 0, 10.h, 16),
      margin: EdgeInsets.only(bottom: 5.h, right: 10, top: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
              bottom: BorderSide(
                  color: const Color(0xff50555C).withOpacity(0.18)))),
      child: Row(
        children: [
          const Expanded(
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(
                Assets.userProfile,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            flex: 7,
            child: TextFormField(
              onTap: () {
                Get.to(() => const CreateCheckInAndOutScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400));
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                fillColor: AppColors.white,
                filled: true,
                hintText: 'Add your Check-In or Check-out...',
                hintStyle: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff232C2E),
                    fontFamily: 'Inter'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide:
                      const BorderSide(color: Color(0xffCDCDCD), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide:
                      const BorderSide(color: Color(0xffCDCDCD), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide:
                      const BorderSide(color: Color(0xffCDCDCD), width: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
