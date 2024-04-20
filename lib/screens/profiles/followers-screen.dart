import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/followers-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/follower-card-widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  final FollowerTabController followeTabController =
      Get.put(FollowerTabController());

  final List<String> labels = [
    'Friends',
    'Venues',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Followers',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack)),
        ),
        body: FollowersList()
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
        );
  }

  Widget _tabBarViews() {
    return GetBuilder<FollowerTabController>(
        init: FollowerTabController(),
        builder: (controller) {
          return [
            const Expanded(child: FollowersList()),
            Expanded(child: Container()),
          ][controller.currentIndex.value];
        });
  }
}

class FollowersList extends StatelessWidget {
  const FollowersList({super.key});

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
        padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return FollowerCardWidget(
            name: nameList[index],
            images: imagesList[index],
          );
        });
  }
}

class FollowerTabButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  // final int index;
  final bool? isSelected;
  const FollowerTabButton(
      {super.key,
      this.onTap,
      this.title,
      // required this.index,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 10.verticalSpace,
            Expanded(
              flex: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                    color:
                        isSelected! ? AppColors.blackColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          isSelected! ? AppColors.white : AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            8.verticalSpace,
            Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                flex: 0,
                child: Container(
                  height: 4,
                  width: 90,
                  decoration: BoxDecoration(
                      color: isSelected! ? AppColors.green : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
