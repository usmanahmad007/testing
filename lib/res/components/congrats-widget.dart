import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';

// ignore: must_be_immutable
class CongratsMessage extends StatelessWidget {
  CongratsMessage({
    super.key,
    required this.congratsMsg,
    required this.onContinue,
    required this.titleMsg,
    this.buttonText = 'Continue to Sign In',
  });

  String? congratsMsg;
  String? titleMsg;
  String? buttonText;
  VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.successMark,
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: Text(
              titleMsg!,
              style: const TextStyle(
                fontSize: 25,
                color: Color(0xff0F172A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            congratsMsg!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xff768089),
                fontWeight: FontWeight.w600),
          ),
          40.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70.w,
            ),
            child: GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: buttonText!,
                onPressed: onContinue,
                width: 200.w),
          ),
        ],
      ),
    );
  }
}
