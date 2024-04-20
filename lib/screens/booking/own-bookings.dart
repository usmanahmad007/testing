import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/booking/tabs/upcoming.dart';
import 'package:nomo_app/screens/booking/tabs/past.dart';
import 'package:nomo_app/screens/booking/tabs/all.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OwnBooking extends StatefulWidget {
  const OwnBooking({super.key});

  @override
  State<OwnBooking> createState() => _OwnBookingState();
}

class _OwnBookingState extends State<OwnBooking>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = [
    'All',
    'Upcoming',
    'Past',
  ];

  final List<Widget> _children = [
    All(),
    Upcoming(),
    Past(),
  ];

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
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              automaticIndicatorColorAdjustment: false,
              // isScrollable: true,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
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
            )),
        Image.asset(
          Assets.greenLine,
          width: double.infinity,
        ),
        // Container(
        //   height: 10, // Adjust the height as needed
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       colors: [Colors.green[700]!, Colors.green[400]!],
        //     ),
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.elliptical(40, 12), // Adjust the radius as needed
        //       topRight: Radius.circular(10), // Adjust the radius as needed
        //     ),
        //     border: Border(
        //       left: BorderSide(
        //         color: Colors.white, // Or any other color for the border
        //         width: 2.0, // Adjust the width as needed
        //       ),
        //       right: BorderSide(
        //         color: Colors.white, // Or any other color for the border
        //         width: 2.0, // Adjust the width as needed
        //       ),
        //     ),
        //   ),
        //   // Add child widgets as needed
        // ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: _children,
          ),
        ),
      ],
    );
  }
}
