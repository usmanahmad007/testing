import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class EmailUpdate extends StatefulWidget {
  const EmailUpdate({super.key});

  @override
  State<EmailUpdate> createState() => _EmailUpdateState();
}

class _EmailUpdateState extends State<EmailUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Email',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFieldWidget(
                hintText: 'email@gmail.com', label: 'Your Email'),
            30.verticalSpace,
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Update',
                onPressed: () {},
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
