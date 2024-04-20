import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/screens/friendRequest/all-contacts.dart';
import 'package:nomo_app/screens/friendRequest/hidden-screen.dart';
import 'package:nomo_app/screens/friendRequest/ignored-screen.dart';
import 'package:nomo_app/screens/friendRequest/recently-added-screen.dart';

class FriendRequestsScreen extends StatelessWidget {
  FriendRequestsScreen({Key? key}) : super(key: key);

  final List<Map> addMeList = [
    {
      "image": Assets.follower1,
      "text1": "Robert Fox",
      "text2": "Robert_577",
      "text3": "20+ Mutual\nFriends",
    },
    {
      "image": Assets.follower2,
      "text1": "Howard",
      "text2": "Howard272",
      "text3": "In my contacts",
    },
    {
      "image": Assets.follower3,
      "text1": "Rushabh",
      "text2": "Rushabh9155",
      "text3": "10+ Mutual\nFriends",
    },
  ];

  final List<Map> quickAddList = [
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
      "image": Assets.follower4,
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
      "image": Assets.follower1,
      "text1": "Kathryn Murphy",
      "text2": "Kathryn9155",
      "text3": "10+ Mutual\nFriends",
    },
    {
      "image": Assets.follower3,
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
        leadingWidth: 100,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,
                color: AppColors.blackColor, size: 24)),
        title: Text(
          'Add Friends',
          maxLines: 2,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.bottomSheet(
                backgroundColor: Colors.transparent,
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(
                      left: 25, right: 25, top: Get.height > 891 ? 130 : 100),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => HiddenScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  'Hidden from Quick Add',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const Divider(thickness: 1, color: Colors.grey),
                            InkWell(
                              onTap: () {
                                Get.to(() => IgnoredScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  'Ignored from Added Me',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const Divider(thickness: 1, color: Colors.grey),
                            InkWell(
                              onTap: () {
                                Get.to(() => RecentlyAddedScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  'Recently Added',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Ink(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 25),
              child:
                  Icon(Icons.more_vert, color: AppColors.blackColor, size: 24),
            ),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              /// TextField Widget View
              TextFieldWidgetView(),
              const SizedBox(height: 20),

              /// AddMeList Widget View
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Added Me',
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              AddMeListWidgetView(),

              /// Quick Add List Widget View
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quick Add',
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AllContactScreen());
                      },
                      child: Text(
                        'All Contacts',
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              QuickAddListWidgetView(),
            ],
          ),
        ),
      ),
    );
  }

  /// TextField Widget View
  Widget TextFieldWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomTextFieldWidget(
        hintText: "Find Friends",
        label: '',
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(Assets.voiceIcon),
        ),
      ),
    );
  }

  /// AddMeList Widget View
  Widget AddMeListWidgetView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addMeList.length,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        addMeList[index]["image"],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addMeList[index]["text1"],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      addMeList[index]["text2"],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      addMeList[index]["text3"],
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
                        const Icon(Icons.close, color: AppColors.kGreyColor2),
                        const SizedBox(height: 15),
                        index == 0
                            ? InkWell(
                                onTap: () {},
                                splashColor: Colors.grey,
                                child: Container(
                                  height: 35,
                                  width: 115,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: AppColors.green),
                                  child: Center(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                splashColor: Colors.grey,
                                child: Container(
                                  height: 35,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color:
                                        AppColors.kGreyColor2.withOpacity(0.2),
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
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.kGreyColor2, thickness: 1),
            const SizedBox(height: 10),
            index == 2
                ? Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View 18 More',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  /// Quick Add List Widget View
  Widget QuickAddListWidgetView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quickAddList.length,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          quickAddList[index]["image"],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quickAddList[index]["text1"],
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        quickAddList[index]["text2"],
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        quickAddList[index]["text3"],
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
                          const Icon(Icons.close, color: Colors.black87),
                          const SizedBox(height: 15),
                          index == 0
                              ? Container(
                                  height: 35,
                                  width: 115,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: AppColors.green),
                                  child: Center(
                                    child: Text(
                                      'Added',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 35,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color:
                                        AppColors.kGreyColor2.withOpacity(0.2),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.person_add),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Add',
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
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1),
          ],
        ),
      ),
    );
  }
}
