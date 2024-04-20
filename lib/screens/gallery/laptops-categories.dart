import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class LaptopsCategory extends StatelessWidget {
  LaptopsCategory({Key? key}) : super(key: key);

  final List<Map> recentlyAddedList = [
    {
      "image": Assets.laptop1,
    },
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
    {"image": Assets.laptop2},
  ];

  final List<Map> august2022List = [
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
    {"image": Assets.laptop1},
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
    {"image": Assets.laptop2},
    {
      "image": Assets.laptop1,
    },
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
    {"image": Assets.laptop2},
    {"image": Assets.laptop2},
    {"image": Assets.laptop1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(Assets.friends),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Recently Added Widget View
              Text(
                'Recently Added',
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),
              RecentlyAddedWidgetView(context),

              const SizedBox(height: 20),

              ///  August 2022 Widget View
              Text(
                'August 2022',
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),
              August2022WidgetView(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Recently Added Widget View
  Widget RecentlyAddedWidgetView(context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2 / 1.6,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: recentlyAddedList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Get.to(() => OpenStoriesScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: AssetImage(recentlyAddedList[index]["image"]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  /// August 2022 Widget View
  Widget August2022WidgetView(context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2 / 1.6,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: august2022List.length,
      physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
