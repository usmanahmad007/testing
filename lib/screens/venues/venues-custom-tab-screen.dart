// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/venue-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/drawer_widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/res/components/venuesWidgets/venue-tab-buttons.dart';
import 'package:nomo_app/screens/locations/add-location-screen.dart';
import 'package:nomo_app/screens/preferences/update-preference-screen.dart';
import 'package:nomo_app/screens/venues/venues-screen.dart';

class VenueCustomTabScreen extends StatefulWidget {
  const VenueCustomTabScreen({super.key});

  @override
  State<VenueCustomTabScreen> createState() => _VenueCustomTabScreenState();
}

class _VenueCustomTabScreenState extends State<VenueCustomTabScreen> {
  final VenueTabController venueTabController = Get.put(VenueTabController());
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> nameList = [
    'FOR YOU',
    'TRENDING',
    'BRANCHES',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            drawer: const DrawerWidget(),
            resizeToAvoidBottomInset: true,
            appBar: GradientAppBar(
              title: 'All Venues',
              leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: SvgPicture.asset(Assets.menu)),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(() => const UpdatePreferenceScreen());
                    },
                    icon: SvgPicture.asset(
                      Assets.preferences,
                      color: AppColors.white,
                    )),
                8.horizontalSpace,
              ],
            ),
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(bottom: 5.h, top: 10),
                  height: 30.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Expanded(
                      //   flex: 0,
                      //   child: IconButton(
                      //       onPressed: () {},
                      //       icon: SvgPicture.asset(Assets.menu)),
                      // ),
                      Expanded(
                        flex: 4,
                        child: GetBuilder(
                            init: VenueTabController(),
                            builder: (venueTabController) {
                              return ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: nameList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return VenueTabButton(
                                      title: nameList[index],
                                      isSelected: venueTabController
                                              .currentIndex.value ==
                                          index,
                                      index: index,
                                      onTap: () => venueTabController
                                          .setCurrentIndex = index,
                                    );
                                  });
                            }),
                      ),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              final double endPosition = _scrollController
                                      .offset +
                                  200; // Customize this value based on your needs
                              _scrollController.animateTo(endPosition,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15.h,
                            )),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                textFieldWidgetView(),
                12.verticalSpace,
                _tabBarViews()
              ],
            ),
          ),
        ));
  }

  Widget textFieldWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SearchFieldWidget(
          preffixIcon: Transform.scale(
            scale: 0.4,
            child: SvgPicture.asset(
              Assets.search,
              height: 20,
              color: AppColors.blackColor,
            ),
          ),
          suffixIcon: Transform.scale(
            scale: 0.4,
            child: SvgPicture.asset(
              Assets.voiceIcon,
              height: 20,
              color: AppColors.blackColor,
            ),
          ),
          controller: controller,
          hintText: 'Search for Venues'),
    );
  }

  Widget _tabBarViews() {
    return GetBuilder<VenueTabController>(
        init: venueTabController,
        builder: (_) {
          return [
            const Expanded(child: VenuesScreen()),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: const Center(
                child: Text('Tab 2'),
              ),
            ),
            const Expanded(child: VenuesScreen()),
          ][venueTabController.currentIndex.value];
        });
  }
}
