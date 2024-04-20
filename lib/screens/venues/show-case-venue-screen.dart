import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class VenueShowCaseScreen extends StatefulWidget {
  const VenueShowCaseScreen({super.key});

  @override
  State<VenueShowCaseScreen> createState() => _VenueShowCaseScreenState();
}

class _VenueShowCaseScreenState extends State<VenueShowCaseScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final List<String> coverImages = [
      Assets.mobile1,
      Assets.mobile2,
      Assets.mobile3,
      Assets.mobile1,
    ];

    final List<String> laptopCoverImages = [
      Assets.laptop1,
      Assets.laptop2,
      Assets.laptop1,
      Assets.laptop2,
    ];

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

    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 3;
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 2.5);

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: GradientAppBar(
        title: 'Venue Showcase',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              12.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                alignment: Alignment.center,
                height: height * .082,
                decoration: BoxDecoration(
                    color: Colors.yellow[200]!.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  "Here, you have the freedom to organize your showcase. Create categories (e.g., 'Lounge' or 'Café' or ‘Library’) and assign pictures or videos to the relevant category for better organization and clarity.",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0xff898A8D),
                      fontWeight: FontWeight.w600),
                ),
              ),
              20.verticalSpace,
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Showcase Category',
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w600),
                      ),
                      5.verticalSpace,
                      buildCustomButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ImageUploadDialog();
                              });
                        },
                        title: 'Upload',
                      ),
                      20.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Covers Collection',
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w600),
                          ),
                          8.verticalSpace,
                          SizedBox(
                            height: 180.h,
                            child: GridView.builder(
                              // padding: EdgeInsets.all(16),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                childAspectRatio: childAspectRatio,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: coverImages.length + 1,
                              itemBuilder: (context, index) {
                                if (index == coverImages.length) {
                                  return GestureDetector(
                                    onTap: () {
                                      // _pickImages();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.neutralGray
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.edit,
                                            color: Color(0xff898A8D),
                                          ),
                                          Text(
                                            'Edit',
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
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(coverImages[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laptop Covers Collection',
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w600),
                          ),
                          8.verticalSpace,
                          SizedBox(
                            height: 180.h,
                            child: GridView.builder(
                              // padding: EdgeInsets.all(16),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                childAspectRatio: childAspectRatio,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: laptopCoverImages.length + 1,
                              itemBuilder: (context, index) {
                                if (index == laptopCoverImages.length) {
                                  return GestureDetector(
                                    onTap: () {
                                      // _pickImages();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.neutralGray
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.edit,
                                            color: Color(0xff898A8D),
                                          ),
                                          Text(
                                            'Edit',
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
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(laptopCoverImages[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              70.verticalSpace,
            ]),
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

class ImageUploadDialog extends StatefulWidget {
  const ImageUploadDialog({super.key});

  @override
  _ImageUploadDialogState createState() => _ImageUploadDialogState();
}

class _ImageUploadDialogState extends State<ImageUploadDialog> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];
  int _longPressedIndex = -1;

  void _pickImages() async {
    try {
      final List<XFile> selectedImages = await _picker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        setState(() {
          _images.addAll(selectedImages);
          _longPressedIndex = -1;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
      _longPressedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 500.h,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.r),
              color: AppColors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                10.w,
                20.h,
                10.w,
                20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFieldWidget(
                        hintText: '',
                        label: 'Category Name',
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Images / Videos',
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 250.h,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: _images.length + 1, // +1 for the add button
                        itemBuilder: (context, index) {
                          // Add button
                          if (index == _images.length) {
                            return GestureDetector(
                              onTap: () {
                                _pickImages();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.neutralGray.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: Color(0xff898A8D),
                                    ),
                                    Text(
                                      'Upload',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color(0xff898A8D),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  _longPressedIndex = index;
                                });
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.file(
                                      File(_images[index].path),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  if (index == _longPressedIndex)
                                    Positioned(
                                      top: -2.r,
                                      right: -2.r,
                                      child: GestureDetector(
                                        onTap: () => _deleteImage(index),
                                        child: const CircleAvatar(
                                            backgroundColor: Color(0xff6F6E6E),
                                            radius: 8,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 13,
                                            )),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    20.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: GradientElevatedButton(
                          gradient: AppColors.gradientColor,
                          label: 'Update',
                          onPressed: () {},
                          width: 210.w),
                    ),
                    10.verticalSpace,
                    Align(alignment: Alignment.center, child: deleteButton()),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: -5,
              top: -5,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  Assets.cross,
                  height: 20.h,
                ),
              ))
        ],
      ),
    );
  }

  Widget deleteButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 38.h,
        width: 210.w,
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
}
