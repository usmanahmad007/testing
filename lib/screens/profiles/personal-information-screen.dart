import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/congrats-widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/screens/auth/email-verification-screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _showEmailInstruction = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        title: 'Personal Information',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(Assets.userProfile),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.upload,
                          height: 40,
                        )),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            CustomTextFieldWidget(
              controller: nameController,
              label: 'Full Name',
              hintText: '',
            ),
            20.verticalSpace,
            emailWidget(),
            if (_showEmailInstruction) ...[
              8.verticalSpace,
              const Text(
                'You cannot change your Email - Contact Support',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    color: Color(0xff711C01),
                    fontWeight: FontWeight.w600),
              ),
            ],
            20.verticalSpace,
            changePassButton(),
            70.verticalSpace,
            GradientElevatedButton(
                gradient: AppColors.gradientColor,
                width: 300.w,
                label: 'Update',
                onPressed: () {
                  Get.off(() => CongratsMessage(
                      congratsMsg:
                          'Your account setting has been\n Updated successfully',
                      onContinue: () {
                        Get.back();
                        Get.back();
                      },
                      titleMsg: 'Setting Update',
                      buttonText: 'Okay'));
                }),
          ],
        ),
      ),
    );
  }

  Widget changePassButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
        10.verticalSpace,
        InkWell(
          onTap: () {
            // Get.to(() => const EmailVerificationScreen(
            //       pageType: 'updatePass',
            //     ));

            showDialog(
                context: context,
                builder: (_) {
                  return emailVerifyPopUp();
                });
          },
          splashColor: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5.r),
          child: Ink(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: const Color(0xffF1F0F0), width: 0.5),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget emailVerifyPopUp() {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        height: 330,
        width: 289,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const Text(
                'Email Verification\n Require',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              const Text(
                'for update your password,\nplease verify your E-mail address',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  label: 'Okay',
                  onPressed: () {
                    Get.back();
                    Get.to(() => const EmailVerificationScreen(
                          pageType: 'updatePass',
                        ));
                  },
                  width: double.infinity),
              const SizedBox(height: 25),
              GradientElevatedButton(
                  color: AppColors.blackColor,
                  label: 'Cancel',
                  onPressed: () {
                    Get.back();
                  },
                  width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email Address',
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
        10.verticalSpace,
        Ink(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xffF8F8F8),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xffF1F0F0), width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'fazsam.com@gmail.com',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: Color(0xff979797),
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      // Toggle the visibility of the instruction text
                      _showEmailInstruction = !_showEmailInstruction;
                    });
                  },
                  icon: SvgPicture.asset(
                    Assets.infoIcon,
                    height: 25,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
