import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/themetext/theme-text.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Phone Verification', style: kBodyLargeMontserrat),
                20.verticalSpace,
                Text(
                    'We sent you a verification code to your\n '
                    'Phone Number XXX XXX XXXX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: montserrat,
                    )),
                30.verticalSpace,
                PinCodeFields(
                  length: 4,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: false,
                  fieldHeight: 40.h,
                  fieldWidth: 50.w,
                  borderWidth: 1.0,
                  animationCurve: Curves.easeInOut,
                  switchInAnimationCurve: Curves.easeIn,
                  switchOutAnimationCurve: Curves.easeOut,
                  animation: Animations.slideInDown,
                  activeBorderColor: AppColors.green,
                  activeBackgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: false,
                  fieldBackgroundColor: Colors.white,
                  borderColor: Colors.black38,
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Did not receive PIN?',
                        maxLines: 2,
                        textScaler: const TextScaler.linear(0.8),
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.blackColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor),
                        ))
                  ],
                ),
                30.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      width: 300.w,
                      label: 'Submit',
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.updatePassword);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
