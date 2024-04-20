import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class RecentlyAddedScreen extends StatelessWidget {
  RecentlyAddedScreen({Key? key}) : super(key: key);

  final List<Map> recentlyAddedList = [
    {
      "image": Assets.follower1,
      "text": "Jenny Wilson",
    },
    {
      "image": Assets.follower2,
      "text": "Darlene Robertson",
    },
    {
      "image": Assets.follower3,
      "text": "Ralph Edwards",
    },
    {
      "image": Assets.follower4,
      "text": "Annette Black",
    },
    {
      "image": Assets.follower5,
      "text": "Leslie Alexander",
    },
    {
      "image": Assets.follower6,
      "text": "Esther Howard",
    },
    {
      "image": Assets.follower7,
      "text": "Guy Hawkins",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios, size: 24)),
        ),
        title: Text(
          'Recently Added',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Friends and subscriptions I have recently\nadded',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          const SizedBox(height: 25),

          ///  Recently Added List Widget View
          Expanded(
            child: RecentlyAddedListWidgetView(),
          ),
        ],
      ),
    );
  }

  /// Recently Added List Widget View
  Widget RecentlyAddedListWidgetView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.neutralGray.withOpacity(0.08),
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: recentlyAddedList.length,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        recentlyAddedList[index]["image"],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      recentlyAddedList[index]["text"],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(color: AppColors.neutralGray, thickness: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
