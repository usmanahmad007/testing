import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/followers-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/following-card-widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  List<String> nameList = [
    'Darrell Steward',
    'Robert Fox',
    'Wade Warren',
    'Kristin Watson',
    'Marvin McKinney',
    'Savannah Nguyen',
    'Guy Hawkins'
  ];

  List<String> imagesList = [
    Assets.follower1,
    Assets.follower2,
    Assets.follower3,
    Assets.follower4,
    Assets.follower5,
    Assets.follower6,
    Assets.follower7,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Following',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack)),
        ),
        body: FollowingList()
        // DefaultTabController(
        //   length: 2,
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         GetBuilder<FollowerTabController>(
        //           init: FollowerTabController(),
        //           builder: (controller) {
        //             return Container(
        //               padding:
        //                   const EdgeInsets.only(left: 20, right: 20, top: 10),
        //               // height: 50,
        //               constraints:
        //                   const BoxConstraints(maxHeight: double.infinity),
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                   color: const Color(0xffF8F8F8),
        //                   borderRadius: BorderRadius.circular(30)),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   for (int i = 0; i < 2; i++)
        //                     Expanded(
        //                       child: InkWell(
        //                         onTap: () => controller.setCurrentIndex = i,
        //                         child: Column(
        //                           children: [
        //                             Container(
        //                               alignment: Alignment.center,
        //                               height: 40,
        //                               decoration: BoxDecoration(
        //                                 color: controller.currentIndex.value == i
        //                                     ? AppColors.blackColor
        //                                     : Colors.transparent,
        //                                 borderRadius: BorderRadius.circular(30),
        //                               ),
        //                               child: Text(
        //                                 i == 0 ? 'Friends' : 'Venues',
        //                                 style: TextStyle(
        //                                     fontSize: 12,
        //                                     color:
        //                                         controller.currentIndex.value == i
        //                                             ? Colors.white
        //                                             : AppColors.blackColor,
        //                                     fontWeight: FontWeight.w600,
        //                                     fontFamily: 'Montserrat'),
        //                               ),
        //                             ),
        //                             5.verticalSpace,
        //                             Container(
        //                                 height: 5,
        //                                 width: 100,
        //                                 decoration: BoxDecoration(
        //                                   color:
        //                                       controller.currentIndex.value == i
        //                                           ? AppColors.green
        //                                           : Colors.transparent,
        //                                   borderRadius: const BorderRadius.only(
        //                                       topLeft: Radius.elliptical(40, 20),
        //                                       topRight:
        //                                           Radius.elliptical(40, 20)),
        //                                 )),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   // if (i == 0)
        //                   const SizedBox(width: 12),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //         _tabBarViews()
        //       ],
        //     ),
        //   ),
        // ),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Expanded(
        //         child: ListView.builder(
        //             shrinkWrap: true,
        //             physics: const BouncingScrollPhysics(),
        //             itemCount: 7,
        //             itemBuilder: (context, index) {
        //               return FollowingCardWidget(
        //                 name: nameList[index],
        //                 images: imagesList[index],
        //               );
        //             }),
        //       )
        //     ],
        //   ),
        // ),
        );
  }

  Widget _tabBarViews() {
    return GetBuilder<FollowerTabController>(
        init: FollowerTabController(),
        builder: (controller) {
          return [
            const Expanded(child: FollowingList()),
            Expanded(child: Container()),
          ][controller.currentIndex.value];
        });
  }
}

class FollowingList extends StatelessWidget {
  const FollowingList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      'Darrell Steward',
      'Robert Fox',
      'Wade Warren',
      'Kristin Watson',
      'Marvin McKinney',
      'Savannah Nguyen',
      'Guy Hawkins'
    ];

    List<String> imagesList = [
      Assets.follower1,
      Assets.follower2,
      Assets.follower3,
      Assets.follower4,
      Assets.follower5,
      Assets.follower6,
      Assets.follower7,
    ];

    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          return FollowingCardWidget(
            name: nameList[index],
            images: imagesList[index],
          );
        });
  }
}
