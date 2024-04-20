import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  // String? emailError;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // bool isValidEmail(String email) {
  //   return RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b').hasMatch(email);
  // }

  String? emailErrorText;

  bool isEmailValid(String email) {
    // Regex pattern for validating email addresses, adjust as needed
    String pattern = r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                const Text('Forgot Password.',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    )),
                12.verticalSpace,
                // const Text(
                //     'Choose which contact details we should use to Reset your Password',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Color(0xff768089),
                //       fontWeight: FontWeight.w600,
                //       fontFamily: 'Montserrat',
                //     )),
                const Text('Please Enter your Email Address',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    )),
                25.verticalSpace,
                CustomTextFieldWidget(
                  controller: emailController,
                  label: 'Email Address',
                  hintText: 'Please enter your email address',
                  errorText: emailErrorText,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                        color: AppColors.orangeColor, width: 1),
                  ),
                  errorStyle: const TextStyle(
                    fontSize: 10,
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (!isEmailValid(value) && value.isNotEmpty) {
                        emailErrorText = "";
                      } else {
                        emailErrorText = null;
                      }
                    });
                    return null;
                  },
                ),
                SizedBox(height: emailErrorText != null ? 5 : 10),
                if (emailErrorText != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 56.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffFDEDEE),
                          border: Border.all(
                              color: AppColors.orangeColor, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "That email address doesn't exist",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          4.verticalSpace,
                          const Text(
                            'The email address you’ve entered doesn’t appear to exist.Please check your email and try again.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff50555C),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                12.verticalSpace,
                if (emailErrorText == null)
                  const Text(
                      'You may receive a 4 digit Pin on your Email for security and Login purpose',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff7B7F85),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      )),
                55.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      width: double.infinity,
                      label: 'Continue',
                      onPressed: () {
                        // Get.offAllNamed(AppRoutes.emailVerify);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return emailVerifyDialog();
                            });
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
