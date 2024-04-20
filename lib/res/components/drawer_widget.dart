// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      clipBehavior: Clip.none,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: Get.height * .5,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xff141C53),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.ddmLogo,
                  height: 90,
                ),
                10.verticalSpace,
                const Text(
                  'Trusted Partner for',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                const Text(
                  'Development, Designing,\nManagement & Marketing',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Divider(
                  endIndent: 40,
                  indent: 40,
                  thickness: 0.5,
                  color: AppColors.white.withOpacity(0.38),
                ),
                10.verticalSpace,
                const Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                contactButton(label: 'Website', onPressed: () {}),
                10.verticalSpace,
                contactButton(label: 'WhatsApp', onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contactButton(
      {required final String label, required final VoidCallback onPressed}) {
    return Container(
      height: 32,
      width: 170,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
