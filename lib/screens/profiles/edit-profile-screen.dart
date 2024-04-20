import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/dropdown-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final DropdownController dropdownController = Get.put(DropdownController());
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> prefereceOptions = ['Option 1', 'Option 2', 'Option 2'];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Edit Profile',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        width: 170.h,
                        left: 45.w,
                        top: 13.h,

                        // bottom: 0,
                        child: InkWell(
                          onTap: () {

                          },
                          splashColor: Colors.grey.shade300,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Ink(
                              height: 43.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                  color: AppColors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r),
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Assets.addIcon),
                                  10.horizontalSpace,
                                  Text(
                                    'Change Image',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: const AssetImage(Assets.profileImage),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  CustomTextFieldWidget(hintText: '', label: 'Name'),
                  20.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      5.verticalSpace,
                      SizedBox(
                        height: 43.h,
                        child: DropdownButtonFormField<String?>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffCDCDCD), width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: dropdownController.selectedGender,
                          onChanged: (String? newValue) {
                            dropdownController.selectGenderIndex(newValue);
                          },
                          items: genderOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferences',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      5.verticalSpace,
                      SizedBox(
                        height: 43.h,
                        child: DropdownButtonFormField<String?>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffCDCDCD), width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: dropdownController.selectedPreference.value,
                          onChanged: (String? value) {
                            dropdownController.selectPreferenceIndex(value);
                          },
                          items: dropdownController.preferenceOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  CustomTextFieldWidget(
                      maxLines: 7, hintText: '', label: 'Bio'),
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: GradientElevatedButton(
                        gradient: AppColors.gradientColor,
                        label: 'Update Profile',
                        onPressed: () {},
                        width: 300.w),
                  )
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
