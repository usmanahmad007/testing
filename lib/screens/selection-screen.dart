import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            82.verticalSpace,
            const Text('Welcome to NOMO',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                )),
            50.verticalSpace,
            SvgPicture.asset(
              Assets.nomoLogo,
              height: 62.h,
            ),
            50.verticalSpace,
            const Text(
                'Create your account to bookmark, book\n      '
                '  ticket and track your history',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                )),
            40.verticalSpace,
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                width: 270.w,
                label: 'Sign Up',
                onPressed: () {
                  Get.offAllNamed(AppRoutes.signup);
                }),
            50.verticalSpace,
            const Text('Already have an account?',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                )),
            20.verticalSpace,
            GradientElevatedButton(
                color: AppColors.blackColor,
                width: 270.w,
                label: 'Sign In',
                onPressed: () {
                  Get.offAllNamed(AppRoutes.login);
                }),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don’t have an account?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    )),
                TextButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signup);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
