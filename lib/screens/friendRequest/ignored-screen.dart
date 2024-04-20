import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class IgnoredScreen extends StatelessWidget {
  IgnoredScreen({Key? key}) : super(key: key);

  final List<Map> ignoredList = [
    {
      "image": Assets.follower1,
      "text1": "Darlene Robertson",
      "text2": "Darlene9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower2,
      "text1": "Jenny Wilson",
      "text2": "Jenny9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower3,
      "text1": "Ralph Edwards",
      "text2": "Ralph9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower4,
      "text1": "Annette Black",
      "text2": "Annette9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower5,
      "text1": "Leslie Alexander",
      "text2": "Leslie9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower6,
      "text1": "Esther Howard",
      "text2": "Esther9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower7,
      "text1": "Guy Hawkins",
      "text2": "Guy9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower1,
      "text1": "Devon Lane",
      "text2": "Devon9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower2,
      "text1": "Dianne Russell",
      "text2": "Dianne9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower3,
      "text1": "Kathryn Murphy",
      "text2": "Kathryn9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower4,
      "text1": "Cody Fisher",
      "text2": "Cody9155",
      "text3": "10+ Mutual\nFriends",
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
          padding: EdgeInsets.only(left: 25),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: 24)),
        ),
        title: Text(
          'Ignored',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.verticalSpace,
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "This is where you can find Fabchatters whose "
                "friend requests you have ignored. We might "
                "hide some friend requests for you if we think "
                "you are not interested in them.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          SizedBox(height: 25),

          ///  Ignored List Widget View
          Expanded(child: IgnoredListWidgetView()),
        ],
      ),
    );
  }

  /// Ignored List Widget View
  Widget IgnoredListWidgetView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ignoredList.length,
          padding: EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              ignoredList[index]["image"],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ignoredList[index]["text1"],
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ignoredList[index]["text2"],
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ignoredList[index]["text3"],
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 10.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.close, color: Colors.black),
                              SizedBox(height: 15),
                              Container(
                                height: 35,
                                width: 115,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.person_add),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Accept',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: AppColors.neutralGray, thickness: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
