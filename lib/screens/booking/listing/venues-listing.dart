import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/booking/listing/all-venues.dart';
import 'package:nomo_app/screens/booking/listing/approved.dart';
import 'package:nomo_app/screens/booking/listing/pending.dart';
import 'package:nomo_app/screens/locations/add-location-screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class VenueListing extends StatefulWidget {
  @override
  State<VenueListing> createState() => _VenueListingState();
}

class _VenueListingState extends State<VenueListing>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = [
    'All',
    'Pending',
    'Approved',
  ];

  final List<Widget> _children = [AllVenues(), Pending(), Approved()];

  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Venues',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddVenueScreen());
              },
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                // Get.to(() => const AddLocationScreen());
              },
              icon: SvgPicture.asset(Assets.search)),
          12.horizontalSpace,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              automaticIndicatorColorAdjustment: false,
              // isScrollable: true,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.neutralGray,
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              tabs: List.generate(
                _tabs.length,
                (index) {
                  return Tab(
                    child: GradientText(
                      _tabs[index],
                      colors: currentIndex == index
                          ? [
                              const Color(0xff449329),
                              const Color(0xffB2E958),
                            ]
                          : [
                              AppColors.kGreyColor3,
                              AppColors.kGreyColor3,
                            ],
                      gradientDirection: GradientDirection.ltr,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 10.sp),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: _children,
            ),
          ),
        ],
      ),
    );
  }
}
