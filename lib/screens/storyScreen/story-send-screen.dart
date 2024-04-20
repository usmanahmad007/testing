import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/send-controller.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/search-field.dart';

class SendScreen extends StatefulWidget {
  SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final SendController sendController = Get.put(SendController());
  List<Map> selectedUsers = [];

  final List<Map> storiesList = [
    {
      "image": Assets.follower1,
      "text1": "My Story",
      "text2": "Just for Friends",
    },
    {
      "image": Assets.follower3,
      "text1": "My Story",
      "text2": "Friends Only",
    },
    {
      "image": Assets.imagesMap,
      "text1": "Fab Map",
      "text2": "Add your Fab to the Map!",
    },
  ];

  final List<Map> bestFriendList = [
    {
      "image": Assets.follower1,
      "text": "Jenny Wilson",
      "isSelected": false,
    },
    {
      "image": Assets.follower2,
      "text": "Darlene Robertson",
      "isSelected": false,
    },
    {
      "image": Assets.follower3,
      "text": "Ralph Edwards",
      "isSelected": false,
    },
    {
      "image": Assets.follower4,
      "text": "Annette Black",
      "isSelected": false,
    },
    {
      "image": Assets.follower5,
      "text": "Leslie Alexander",
      "isSelected": false,
    },
    {
      "image": Assets.follower6,
      "text": "Esther Howard",
      "isSelected": false,
    },
    {
      "image": Assets.follower7,
      "text": "Guy Hawkins",
      "isSelected": false,
    },
  ];

  final List<Map> recentList = [
    {
      "image": Assets.follower4,
      "text": "Jenny Wilson",
      "isSelected": false,
    },
    {
      "image": Assets.follower3,
      "text": "Darlene Robertson",
      "isSelected": false,
    },
    {
      "image": Assets.follower2,
      "text": "Ralph Edwards",
      "isSelected": false,
    },
    {
      "image": Assets.follower1,
      "text": "Annette Black",
      "isSelected": false,
    },
    {
      "image": Assets.follower7,
      "text": "Leslie Alexander",
      "isSelected": false,
    },
    {
      "image": Assets.follower6,
      "text": "Esther Howard",
      "isSelected": false,
    },
    {
      "image": Assets.follower5,
      "text": "Guy Hawkins",
      "isSelected": false,
    },
    {
      "image": Assets.follower4,
      "text": "Annette Black",
      "isSelected": false,
    },
    {
      "image": Assets.follower3,
      "text": "Leslie Alexander",
      "isSelected": false,
    },
    {
      "image": Assets.follower2,
      "text": "Esther Howard",
      "isSelected": false,
    },
    {
      "image": Assets.follower1,
      "text": "Guy Hawkins",
      "isSelected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: selectedUsers.isNotEmpty
          ? BottomBarWidget(selectedUsers: selectedUsers)
          : null,
      backgroundColor: AppColors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              /// TextField Widget View
              TextFieldWidgetView(),

              /// Stories Widget View
              StoriesWidgetView(),

              /// BestFriend Widget View
              BestFriendWidgetView(),

              /// Recent Widget View
              RecentWidgetView(),

              const SizedBox(height: 20),
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
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: SearchFieldWidget(hintText: 'Type to search..'),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child:
                  const Icon(Icons.close, color: AppColors.black2A3, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  /// Stories Widget View
  Widget StoriesWidgetView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stories',
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                color: AppColors.black2A3,
                fontWeight: FontWeight.w600),
          ),
          GetBuilder<SendController>(
            init: SendController(),
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: storiesList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      controller.onStoriesIndexChange(index);
                      bool isSelected = bestFriendList[index]["isSelected"];
                      bestFriendList[index]["isSelected"] = !isSelected;

                      if (!isSelected) {
                        selectedUsers.add(bestFriendList[index]);
                      } else {
                        selectedUsers.removeWhere((user) =>
                            user["text"] == bestFriendList[index]["text"]);
                      }

                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  storiesList[index]["image"],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                storiesList[index]["text1"],
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Montserrat',
                                    color: controller.storiesIndex == index
                                        ? AppColors.green
                                        : AppColors.black2A3,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                storiesList[index]["text2"],
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.greyABA,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                  controller.storiesIndex == index
                                      ? Assets.checkImage
                                      : Assets.uncheckImage),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: AppColors.neutralGray, thickness: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// BestFriend Widget View
  Widget BestFriendWidgetView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Friends',
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                color: AppColors.black2A3,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bestFriendList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      bestFriendList[index]["isSelected"] =
                          !bestFriendList[index]["isSelected"];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                bestFriendList[index]["image"],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          bestFriendList[index]["text"],
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              color: bestFriendList[index]["isSelected"] == true
                                  ? AppColors.green
                                  : AppColors.black2A3,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                                bestFriendList[index]["isSelected"] == true
                                    ? Assets.checkImage
                                    : Assets.uncheckImage),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: AppColors.neutralGray, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Recent Widget View
  Widget RecentWidgetView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recents',
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                color: AppColors.black2A3,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      recentList[index]["isSelected"] =
                          !recentList[index]["isSelected"];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                recentList[index]["image"],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          recentList[index]["text"],
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              color: recentList[index]["isSelected"] == true
                                  ? AppColors.green
                                  : AppColors.black2A3,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                                recentList[index]["isSelected"] == true
                                    ? Assets.checkImage
                                    : Assets.uncheckImage),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: AppColors.neutralGray, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final List<Map> selectedUsers;

  BottomBarWidget({required this.selectedUsers});

  String getSelectedUserNames() {
    return selectedUsers.map((user) => user["text"]).join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.green,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                getSelectedUserNames(),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
