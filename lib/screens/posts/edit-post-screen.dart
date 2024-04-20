import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({super.key});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
          title: 'Edit Post',
          leading: IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.arrowBack))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4.h,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: 'Write on your mind? ...... ',
                      hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xff232C2E),
                          fontFamily: 'inter'),
                      border: InputBorder.none,
                    ),
                  ),
                  // 20.verticalSpace,
                  AspectRatio(
                    aspectRatio: 22 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 6,
                              offset: const Offset(0, -3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Container(
                        margin: EdgeInsets.all(5.h),
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(Assets.googleMap),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // height: 93.h,

            constraints: const BoxConstraints(maxHeight: double.infinity),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, -3),
                  ),
                ],
                border: Border(
                    top: BorderSide(
                  color: const Color(0xffC5C5C5).withOpacity(0.3),
                  width: 2,
                ))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 10.h, 25.h, 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo,
                          color: Color(0xff5C6363),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Color(0xff5C6363),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          color: AppColors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_add,
                          color: Color(0xff5C6363),
                        ),
                      ),
                    ],
                  ),
                  GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      label: 'Update',
                      onPressed: () {},
                      width: 100.h),
                ],
              ),
            ),
          ),
          // 50.verticalSpace,
        ],
      ),
    );
  }
}
