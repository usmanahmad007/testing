import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Address',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFieldWidget(
                  hintText: 'Type Here', label: 'Street address'),
              10.verticalSpace,
              CustomTextFieldWidget(hintText: 'Type Here', label: 'City'),
              10.verticalSpace,
              CustomTextFieldWidget(hintText: 'Type Here', label: 'State'),
              10.verticalSpace,
              CustomTextFieldWidget(hintText: 'Type Here', label: 'Zip code'),
              10.verticalSpace,
              CustomTextFieldWidget(hintText: 'Type Here', label: 'Country'),
              30.verticalSpace,
              GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  label: 'Update',
                  onPressed: () {},
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
