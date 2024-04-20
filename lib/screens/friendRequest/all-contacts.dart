import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/custom-button.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/screens/friendRequest/frient-request-screen.dart';

class AllContactScreen extends StatelessWidget {
  AllContactScreen({Key? key}) : super(key: key);

  final List<Map> friendsFabChatList = [
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
        leadingWidth: 100,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,
                color: Colors.black, size: 24)),
        title: Text(
          'All Contacts',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Friends',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),

              /// Friends On FabChat List Widget View
              FriendsOnFabChatListWidgetView(),
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
          child: Transform.scale(
            scale: 0.7,
            child: SvgPicture.asset(
              Assets.voiceIcon,
              color: Colors.black,
              height: 10,
            ),
          ),
        ),
      ),
    );
  }

  /// Friends On FabChat List Widget View
  Widget FriendsOnFabChatListWidgetView() {
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
        itemCount: friendsFabChatList.length,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.bottomSheet(
              backgroundColor: Colors.transparent,
              Container(
                margin: EdgeInsets.only(
                    left: 25, right: 25, top: Get.height > 891 ? 150 : 240),
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                    Assets.follower1,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Darlene',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'View Profile',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: AppColors.green00D,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person_add,
                                          color: AppColors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Add',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.sp,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward_ios,
                                    color: Colors.black, size: 20)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                backgroundColor: AppColors.white,
                                contentPadding: EdgeInsets.zero,
                                title: "",
                                titlePadding: EdgeInsets.zero,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Column(
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Are you sure you want to Block Darlene - Darlene9155?',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 20),
                                      //                       GradientElevatedButton(
                                      // gradient: AppColors.gradientColor,
                                      // label: 'Block',
                                      // onPressed: () {
                                      //    Get.to(
                                      //                                 () => FriendRequestsScreen());
                                      // },
                                      // width: 120),
                                      CommonButtonWidget.button(
                                          onTap: () {
                                            Get.to(
                                                () => FriendRequestsScreen());
                                          },
                                          text: "Block"),
                                      const SizedBox(height: 20),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          "CANCEL",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Block',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13.sp,
                                    color: AppColors.green00D,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const Divider(
                              thickness: 1, color: AppColors.neutralGray),
                          InkWell(
                            onTap: () {
                              // Get.to(() => ReportScreen1());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Report',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13.sp,
                                    color: AppColors.green00D,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const Divider(
                              thickness: 1, color: AppColors.neutralGray),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Ignore Friend Recommendation',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.sp,
                                  color: AppColors.green00D,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Divider(
                              thickness: 1, color: AppColors.neutralGray),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Send Profile to...',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.green00D,
                                  child: Icon(Icons.send_rounded,
                                      color: Colors.white, size: 20),
                                ),
                              ],
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
                      child: Container(
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
              isScrollControlled: true,
            );
          },
          child: Column(
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
                            friendsFabChatList[index]["image"],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          friendsFabChatList[index]["text1"],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          friendsFabChatList[index]["text2"],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          friendsFabChatList[index]["text3"],
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
                            const Icon(Icons.close, color: Colors.black),
                            const SizedBox(height: 15),
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
                                  const Icon(Icons.person_add,
                                      color: Colors.black, size: 20),
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
              const Divider(thickness: 1, color: AppColors.neutralGray),
            ],
          ),
        ),
      ),
    );
  }
}
