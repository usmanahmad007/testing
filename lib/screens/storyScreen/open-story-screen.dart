import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class OpenStoriesScreen extends StatelessWidget {
  OpenStoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.friends),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.asset(Assets.storyCanvasImage, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 55),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(Assets.follower2),
                // child: Image.asset(Assets.follower2, height: 25, width: 25)
              ),
              horizontalTitleGap: 8,
              title: Text(
                'Robert fox',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    color: AppColors.black2A3,
                    fontWeight: FontWeight.w600),
              ),
              trailing: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close,
                    color: AppColors.blackColor, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
