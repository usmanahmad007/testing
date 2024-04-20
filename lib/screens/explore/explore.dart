import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/explore-widgets/explore-find-hotel.dart';
import 'package:nomo_app/res/components/explore-widgets/explore-tab-bar.dart';
import 'package:nomo_app/screens/explore/explore-tabs.dart';
import 'package:nomo_app/screens/locations/add-location-screen.dart';

class ExploreScreen extends StatelessWidget {
  final List<String> labels = [
    'Recommendation',
    'Near for you',
  ];

  final List<Widget> tabData = [
    const Recommended(),
    const Recommended(),
  ];

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: labels.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        floatingActionButton: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 10,
          onPressed: () {
            Get.to(() => const AddVenueScreen());
          },
          icon: SvgPicture.asset(
            Assets.addVenue,
            height: 60,
          ),
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.white,
                centerTitle: true,
                expandedHeight: height * .32,
                pinned: true,
                titleSpacing: 0.0,
                title: Container(
                  height: 48,
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  width: Get.width,
                  // color: AppColors.white,
                  decoration:
                      const BoxDecoration(gradient: AppColors.gradientColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: AppColors.white,
                              )),
                          20.horizontalSpace,
                          Text(
                            'Explore',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                                color: AppColors.white),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(Assets.follower3),
                      )
                    ],
                  ),
                ),
                flexibleSpace: const ExploreFindHotel(),
                bottom: ExploreTabBar(labels: labels),
              ),
            ];
          },
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: tabData,
          ),
        ),
      ),
    );
  }
}
