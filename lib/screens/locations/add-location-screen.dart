import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/screens/locations/location-map-screen.dart';
import 'package:nomo_app/screens/locations/set-time-screen.dart';
import 'package:nomo_app/screens/preferences/preferences-screen.dart';
import 'package:nomo_app/screens/venues/show-case-venue-screen.dart';

class AddVenueScreen extends StatefulWidget {
  const AddVenueScreen({super.key});

  @override
  State<AddVenueScreen> createState() => _AddVenueScreenState();
}

class _AddVenueScreenState extends State<AddVenueScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // final DropdownController dropdownController = Get.put(DropdownController());

    // List<String> prefereceOptions = [
    //   'Select Preferences',
    //   'Option 1',
    //   'Option 2',
    //   'Option 2'
    // ];

    File? image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: GradientAppBar(
        title: 'Add Venue',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                height: height,
                width: width,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 80.h),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Venue Cover Image',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  5.verticalSpace,
                                  if (image != null)
                                    Container(
                                      height: Get.height * .2,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: FileImage(image!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  else
                                    buildCustomButton(
                                      onTap: getImageFromGallery,
                                      title: 'Upload',
                                    ),
                                ],
                              )),
                          12.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFieldWidget(
                                    hintText: '', label: 'Venue Title'),
                                12.verticalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Venue Location',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    5.verticalSpace,
                                    buildCustomButton(
                                      onTap: () {
                                        Get.to(() => const MapLocationScreen());
                                      },
                                      title: 'Select Location',
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          12.verticalSpace,
                          customSelectionButton(
                              onTap: () {
                                Get.to(() => const PreferencesScreen());
                              },
                              title: 'Select Preferences'),
                          20.verticalSpace,
                          customSelectionButton(
                              onTap: () {
                                Get.to(() => const VenueShowCaseScreen());
                              },
                              title: 'Add Venue Showcase Images or Videos'),
                          20.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: CustomTextFieldWidget(
                                maxLines: 5,
                                hintText: '',
                                label: 'Venue Description'),
                          ),

                          12.verticalSpace,
                          // customSelectionButton(
                          //     onTap: () {},
                          //     title: 'Add Showcase Images or Videos'),
                          // 20.verticalSpace,
                          customSelectionButton(
                              onTap: () {
                                Get.to(() => const SetTimeScreen());
                              },
                              title: 'Set Venue Open Days & Timing'),
                          // Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                          //     child: buildCustomButton(
                          //         onTap: () {
                          //           Get.to(() => const SetTimeScreen());
                          //         },
                          //         title: 'Set Time',
                          //         label: 'Select Time')),
                          30.verticalSpace,
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 20.w, vertical: 8.h),
                          //   alignment: Alignment.center,
                          //   height: height * .082,
                          //   decoration: BoxDecoration(
                          //       color: Colors.yellow[200]!.withOpacity(0.3),
                          //       borderRadius: BorderRadius.circular(10.r)),
                          //   child: Text(
                          //     "Here, you have the freedom to organize your showcase. Create categories (e.g., 'Lounge' or 'Café' or ‘Library’) and assign pictures or videos to the relevant category for better organization and clarity.",
                          //     textAlign: TextAlign.justify,
                          //     textDirection: TextDirection.ltr,
                          //     style: TextStyle(
                          //         fontSize: 10.sp,
                          //         color: const Color(0xff898A8D),
                          //         fontWeight: FontWeight.w600),
                          //   ),
                          // ),
                          // 20.verticalSpace,
                          // Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Create Showcase Category',
                          //           style: TextStyle(
                          //               fontSize: 11.sp,
                          //               fontWeight: FontWeight.w600),
                          //         ),
                          //         5.verticalSpace,
                          //         buildCustomButton(
                          //           onTap: () {},
                          //           title: 'Category',
                          //         ),
                          //       ],
                          //     )),
                          // 12.verticalSpace,

                          Align(
                            alignment: Alignment.center,
                            child: GradientElevatedButton(
                                gradient: AppColors.gradientColor,
                                label: 'Submit',
                                onPressed: () {},
                                width: 250.w),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Expanded(
                          //             child: CustomTextFieldWidget(
                          //                 hintText: '', label: ''),
                          //           ),
                          //           Expanded(
                          //             flex: 0,
                          //             child: Align(
                          //               alignment: Alignment.center,
                          //               child: IconButton(
                          //                   onPressed: () {},
                          //                   icon: SvgPicture.asset(
                          //                     Assets.editProfileIcon,
                          //                     color: AppColors.blackColor,
                          //                   )),
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //       CustomTextFieldWidget(hintText: '', label: ''),
                          //       CustomTextFieldWidget(hintText: '', label: ''),
                          //     ],
                          //   ),
                          // ),
                          // 12.verticalSpace,
                        ]),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget customSelectionButton({
    required VoidCallback onTap,
    required String title,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: AppColors.neutralGray),
                  bottom: BorderSide(color: AppColors.neutralGray))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.arrow_right,
                color: Colors.black,
              )
            ],
          )),
    );
  }

  Widget buildCustomButton({
    required VoidCallback onTap,
    required String title,
  }) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height * .082,
        decoration: BoxDecoration(
            color: const Color(0xff898A8D).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Color(0xff898A8D),
            ),
            5.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xff898A8D),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

Widget deleteButton() {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 38.h,
      width: 180.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.neutralGray)),
      child: Center(
        child: Text(
          'Delete',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
