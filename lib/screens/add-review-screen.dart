import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
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

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController controller = TextEditingController();
  File? _image;
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Add Review',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.follower1),
          ),
          15.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCard(),
              10.verticalSpace,
              const Divider(
                thickness: 1.5,
                color: Color(0xffE5E7EB),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Add Photo or Video',
                        style: TextStyle(
                            color: Color(0xff1F2A37),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat')),
                    14.verticalSpace,
                    DottedBorder(
                        color: AppColors.neutralGray,
                        strokeWidth: 1.5,
                        radius: const Radius.circular(10),
                        dashPattern: const [6, 6],
                        borderType: BorderType.RRect,
                        child: GestureDetector(
                          onTap: getImageFromGallery,
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _image!,
                                      width: double.infinity,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(Assets.cloud),
                                      const Text('Click here to upload',
                                          style: TextStyle(
                                              color: Color(0xff9DA4AE),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Montserrat')),
                                    ],
                                  ),
                          ),
                        )),
                    40.verticalSpace,
                    const Text('Write your review',
                        style: TextStyle(
                            color: Color(0xff1F2A37),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat')),
                    14.verticalSpace,
                    DottedBorder(
                        color: AppColors.neutralGray,
                        strokeWidth: 1.5,
                        radius: const Radius.circular(10),
                        dashPattern: const [6, 6],
                        borderType: BorderType.RRect,
                        child: Container(
                            // height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: controller,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                  hintText:
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard  ",
                                  hintMaxLines: 3,
                                  hintStyle: TextStyle(
                                      color: Color(0xff9DA4AE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Montserrat'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ))),
                    8.verticalSpace,
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text('350 characters remaining',
                          style: TextStyle(
                              color: Color(0xff9DA4AE),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat')),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  width: 280.w,
                  label: 'Submit Review',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return buildSubmitReviewDialog();
                        });
                  }),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmitReviewDialog() {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Container(
        height: 280,
        width: 279,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.verticalSpace,
              const Text(
                'Thank you for\n submit your review',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
              10.verticalSpace,
              Image.asset(
                Assets.star,
                height: 55,
              ),
              20.verticalSpace,
              GradientElevatedButton(
                  gradient: AppColors.gradientColor,
                  width: 170.w,
                  label: 'Delete',
                  onPressed: () {
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                color: AppColors.neutralGray.withOpacity(0.4),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: 120.w,
              margin: const EdgeInsets.only(left: 6, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage(Assets.resortImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nature Pure, Hotel',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: "Montserrat"),
                    ),
                    8.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.locationBlack),
                        5.horizontalSpace,
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: const Color(0xff6F6E6E),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFFC107),
                        ),
                        3.horizontalSpace,
                        Text(
                          '4.7',
                          style: TextStyle(
                              color: const Color(0xff6F6E6E),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
