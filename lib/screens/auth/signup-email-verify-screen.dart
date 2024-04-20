import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/congrats-widget.dart';
import 'package:nomo_app/res/themetext/theme-text.dart';

class SignUpEmailVerifyScreen extends StatefulWidget {
  const SignUpEmailVerifyScreen({
    super.key,
  });

  @override
  State<SignUpEmailVerifyScreen> createState() =>
      _SignUpEmailVerifyScreenState();
}

class _SignUpEmailVerifyScreenState extends State<SignUpEmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                const Text('Email Verification',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    )),
                35.verticalSpace,
                const Text('Please enter the PIN received in your email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff768089),
                      fontWeight: FontWeight.w600,
                      fontFamily: montserrat,
                    )),
                10.verticalSpace,
                const Text('johndoe@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: montserrat,
                    )),
                20.verticalSpace,
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
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Did not receive PIN?',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.blackColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600)),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              color: AppColors.blackColor),
                        ))
                  ],
                ),
                45.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      width: 280.w,
                      label: 'Submit',
                      onPressed: () {
                        Get.to(() => CongratsMessage(
                              congratsMsg:
                                  'Your Account has been created successfully',
                              onContinue: () =>
                                  Get.offAllNamed(AppRoutes.login),
                              titleMsg: 'Congratulations!',
                            ));
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
