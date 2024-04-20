import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class BioUpdate extends StatefulWidget {
  const BioUpdate({super.key});

  @override
  State<BioUpdate> createState() => _BioUpdateState();
}

class _BioUpdateState extends State<BioUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Bio',
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
                maxLines: 5, hintText: 'Type Here', label: 'Bio'),
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
