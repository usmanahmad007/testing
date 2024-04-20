import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/login-controller.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/social-media-button.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import '../../AppRoutes/app-routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: GetBuilder(
            init: LoginController(),
            builder: (loginController) {
              return Form(
                key: loginController.signinFormKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        40.verticalSpace,
                        const Text('Welcome to NOMO',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            )),
                        40.verticalSpace,
                        const Text('Sign In with',
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            )),
                        30.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: SocialMediaButton(
                                onTap: () {},
                                buttonIcon: Assets.google,
                                buttonText: 'Google',
                              )),
                              20.horizontalSpace,
                              Expanded(
                                  child: SocialMediaButton(
                                onTap: () {},
                                buttonIcon: Assets.instagram,
                                buttonText: 'Instagram',
                              )),
                            ],
                          ),
                        ),
                        30.verticalSpace,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Divider(
                                indent: 80,
                                endIndent: 60,
                                color: Color(0xff4D4D4D),
                                thickness: 1,
                              ),
                            ),
                            Text('Or',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                )),
                            Expanded(
                              child: Divider(
                                indent: 80,
                                endIndent: 60,
                                color: Color(0xff4D4D4D),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              CustomTextFieldWidget(
                                controller: loginController.emailController,
                                label: 'Email Address',
                                hintText: 'Please enter your email address',
                                // onValidator: Utils.emailValidator,
                              ),
                              13.verticalSpace,
                              CustomTextFieldWidget(
                                controller: loginController.passController,
                                obscureText: loginController.isHide.value,
                                label: 'Password',
                                hintText: 'Please enter the password',
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 20.w),
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: InkWell(
                                      onTap: () {
                                        loginController.setIsHide =
                                            !loginController.isHide.value;
                                      },
                                      child: SvgPicture.asset(
                                        loginController.isHide.value
                                            ? Assets.eyeVisibleOff
                                            : Assets.eyeVisible,
                                        height: 3.h,
                                        width: 3.w,
                                      ),
                                    ),
                                  ),
                                ),
                                // onValidator: Utils.passValidator
                              ),
                            ],
                          ),
                        ),
                        5.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.forget);
                              },
                              child: const Text('Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  )),
                            ),
                          ),
                        ),
                        30.verticalSpace,
                        GradientElevatedButton(
                            gradient: AppColors.gradientColor,
                            width: 280.w,
                            label: 'Sign In',
                            onPressed: () {
                              if (loginController.signinFormKey!.currentState!
                                  .validate()) {
                                Get.offAllNamed(AppRoutes.customerBottomNav);
                              }
                            }),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?",
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
                ),
              );
            }),
      ),
    );
  }
}
