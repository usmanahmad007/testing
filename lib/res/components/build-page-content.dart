// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class PageContent extends StatelessWidget {
  String? title;
  String? subtitle;
  String? description;
  String? image;
  PageContent(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 420.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image!), fit: BoxFit.cover)),
              ),
              Container(
                width: double.infinity,
                height: 420.h,
                decoration: BoxDecoration(
                    color: AppColors.blackColor.withOpacity(0.60)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.verticalSpace,
                      Text(
                        title!,
                        // "Find Your Interests",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'Montserrat',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          subtitle!,
                          // "Find the places, venues, restaurants near you",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          // textScaleFactor: 0.9,

                          style: const TextStyle(
                              fontSize: 12,
                              letterSpacing: 1,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Expanded(
          child: SizedBox(
            width: 270.w,
            child: Text(
              description!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}
