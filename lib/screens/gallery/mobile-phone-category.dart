import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class MobileCategory extends StatelessWidget {
  MobileCategory({Key? key}) : super(key: key);

  final List<Map> august2022List = [
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile2,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile2,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile3,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile3,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile2,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile3,
    },
    {
      "image": Assets.mobile1,
    },
    {
      "image": Assets.mobile2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CameraRollWidgetView(context),
    );
  }

  /// CameraRoll Widget View
  Widget CameraRollWidgetView(context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2 / 1.6,
        ),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: august2022List.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.to(() => OpenImageScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(august2022List[index]["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
