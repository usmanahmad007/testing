import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class HiddenScreen extends StatelessWidget {
  HiddenScreen({Key? key}) : super(key: key);

  final List<Map> hiddenList = [
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
          padding: EdgeInsets.only(left: 30),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: 24)),
        ),
        title: Text(
          'Hidden',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.08),
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
              // physics: NeverScrollableScrollPhysics(),
              itemCount: hiddenList.length,
              padding: EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) => Column(
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
                                hiddenList[index]["image"],
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hiddenList[index]["text1"],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              hiddenList[index]["text2"],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              hiddenList[index]["text3"],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 35,
                              width: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: index == 0
                                    ? Colors.green[200]
                                    : Colors.grey[200],
                              ),
                              child: Center(
                                child: Text(
                                  index == 0 ? "Removed" : "Remove",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 11.sp,
                                      color: index == 0
                                          ? Colors.black54
                                          : Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
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
      ),
    );
  }
}
