// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/controllers/custom-tab-controller.dart';
import 'package:nomo_app/controllers/shared-index-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/categories-button.dart';
import 'package:nomo_app/res/components/categories-card.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/drawer_widget.dart';
import 'package:nomo_app/res/components/home-page-search-widget.dart';
import 'package:nomo_app/res/components/search-sheet-widget.dart';
import 'package:nomo_app/screens/explore/explore.dart';
import 'package:nomo_app/screens/messages/messages.dart';
import 'package:nomo_app/screens/storyScreen/effect-screen.dart';
import 'package:nomo_app/screens/storyScreen/stories-section.dart';
import 'package:nomo_app/screens/venues/all-places-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CustomTabController controller = Get.put(CustomTabController());
  SharedController sharedController = Get.find<SharedController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    controller = Get.put(CustomTabController());
    controller.setCurrentIndex = 1;
    loadCustomMarker();
  }

  BoxDecoration getTabDecoration(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const BoxDecoration(color: AppColors.orangeColor);
      case 1:
        return const BoxDecoration(gradient: AppColors.gradientColor);
      case 2:
        return const BoxDecoration(color: Color(0xff50555C));
      default:
        return const BoxDecoration(gradient: AppColors.gradientColor);
    }
  }

  buttonTabColors(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AppColors.orangeColor;
      case 1:
        return AppColors.green;
      case 2:
        return const Color(0xff50555C);
    }
  }

  lineColors(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AppColors.orangeColor;
      case 1:
        return AppColors.green;
      case 2:
        return const Color(0xff50555C);
    }
  }

  textFieldColors(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Color(0xff9C2702);
      case 1:
        return const Color(0xff277906);
      case 2:
        return const Color(0xff2E3135);
    }
  }

  bool isHide = true;

  final List<Map<String, String>> gridItems = [
    {
      'image': Assets.royalVila,
      'title': 'Royal Villa',
      'subtitle': 'Puncak, Bogor',
      'status': 'Busy'
    },
    {
      'image': Assets.forestry,
      'title': 'Forestry Hotel',
      'subtitle': 'Sembalun, Lombok',
      'status': 'Quite'
    },
    {
      'image': Assets.greenVila,
      'title': 'Ubud Green Villa',
      'subtitle': 'Ubud, Bali',
      'status': 'Chilled',
    },
    {
      'image': Assets.forestry,
      'title': 'Forestry Hotel',
      'subtitle': 'Sembalun, Lombok',
      'status': 'Quite',
    },
  ];

  final List<Map<String, String>> categoryItems = [
    {
      'icon': Assets.emotions,
      'title': 'Bars',
    },
    {
      'icon': Assets.university,
      'title': 'Universities',
    },
    {
      'icon': Assets.branch,
      'title': 'Brunches',
    },
    {
      'icon': Assets.dining,
      'title': 'Fine Dining',
    },
    {
      'icon': Assets.nightLife,
      'title': 'Night Life',
    },
    {
      'icon': Assets.emotions,
      'title': 'Bars',
    },
    {
      'icon': Assets.university,
      'title': 'Universities',
    },
    {
      'icon': Assets.branch,
      'title': 'Brunches',
    },
  ];

  final List<Color> borderSidecolor = [
    AppColors.orangeColor,
    AppColors.green,
    const Color(0xff6B6B6B),
    AppColors.green,
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final List<Marker> _marker = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14.4746,
  );

  Future<BitmapDescriptor> getCustomMarkerIcon() async {
    final ByteData byteData = await rootBundle.load(Assets.locationMarker);
    final Uint8List bytes = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  void loadCustomMarker() async {
    final BitmapDescriptor customIcon = await getCustomMarkerIcon();
    final List<Marker> customMarkers = [
      Marker(
          markerId: const MarkerId('1'),
          position: const LatLng(33.738045, 73.084488),
          infoWindow: const InfoWindow(title: 'My Position'),
          icon: customIcon,
          onTap: () => showLocationDetails(context)),
      Marker(
          markerId: const MarkerId('2'),
          position: const LatLng(33.7297, 73.0746),
          infoWindow: const InfoWindow(title: 'F-6 Markaz'),
          icon: customIcon,
          onTap: () => showLocationDetails(context)),
      Marker(
          markerId: const MarkerId('3'),
          position: const LatLng(33.7087, 73.0397),
          infoWindow: const InfoWindow(title: 'F-8 Markaz'),
          icon: customIcon,
          onTap: () => showLocationDetails(context)),
      Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(33.6973, 73.0515),
        infoWindow: const InfoWindow(title: 'G-8 Markaz'),
        icon: customIcon,
      ),
    ];
    setState(() {
      _marker.addAll(customMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        sharedController.updateIndex(controller.currentIndex.value);
      }
    });
    return GetBuilder<CustomTabController>(
        init: controller,
        builder: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              sharedController.updateIndex(controller.currentIndex.value);
            }
          });
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                key: _scaffoldKey,
                drawer: const DrawerWidget(),
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration:
                          getTabDecoration(controller.currentIndex.value),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _scaffoldKey.currentState?.openDrawer();
                                    },
                                    icon: SvgPicture.asset(
                                      Assets.menu,
                                      color: Colors.white,
                                    )),
                                5.horizontalSpace,
                                Expanded(
                                  child: searchWidget(
                                    onTap: () {
                                      searchPlaces(context);
                                    },
                                    hintText: 'What you are looking for?',
                                    suffixIcon: Transform.scale(
                                      scale: 0.4,
                                      child: SvgPicture.asset(
                                        Assets.voiceIcon,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    filledColor: textFieldColors(
                                        controller.currentIndex.value),
                                  ),
                                ),
                                5.horizontalSpace,
                                Row(
                                  children: [
                                    PopupMenuButton(
                                      padding: EdgeInsets.zero,
                                      color: AppColors.white,
                                      position: PopupMenuPosition.under,
                                      icon: Center(
                                          child: SvgPicture.asset(
                                        Assets.addStory,
                                        height: 24,
                                      )),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            value: 'view',
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'View Stories',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'stories',
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Add Stories',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ];
                                      },
                                      onSelected: (String value) {
                                        switch (value) {
                                          case 'view':
                                            Get.to(
                                                () => const StoriesSection());

                                            break;
                                          case 'stories':
                                            Get.to(() => const EffectScreen());
                                            break;
                                        }
                                      },
                                    ),
                                    4.horizontalSpace,
                                    InkWell(
                                        onTap: () {
                                          Get.to(() => const MessagesScreen());
                                        },
                                        child: SvgPicture.asset(
                                          Assets.msg,
                                          color: Colors.white,
                                        )),
                                    8.horizontalSpace
                                  ],
                                ),
                              ],
                            ),
                          ),
                          18.verticalSpace,
                          Expanded(
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                shrinkWrap: true,
                                itemCount: categoryItems.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoriesButton(
                                    assets: categoryItems[index]['icon'],
                                    color: buttonTabColors(
                                        controller.currentIndex.value),
                                    title: categoryItems[index]['title'],
                                    onTap: () {
                                      Get.to(() => ExploreScreen());
                                    },
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 172.h,
                      // bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50.h,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Row(
                          children: [
                            _buildBusyPlacesItem(
                                title: 'Busy Places',
                                index: 0,
                                isSelected: controller.currentIndex.value == 0,
                                onTap: () {
                                  controller.setCurrentIndex = 0;
                                  controller.toggleVisibility();
                                }),
                            _buildAllTab(
                                title: 'All',
                                index: 1,
                                isSelected: controller.currentIndex.value == 1,
                                onTap: () {
                                  controller.setCurrentIndex = 1;
                                  controller.toggleVisibility();
                                }),
                            _buildQuitPlacesTab(
                                title: 'Quiet Places',
                                index: 2,
                                isSelected: controller.currentIndex.value == 2,
                                onTap: () {
                                  controller.setCurrentIndex = 2;
                                  controller.toggleVisibility();
                                }),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.313,
                      left: width * 0.05,
                      right: width * 0.05,
                      child: Container(
                        height: height * 0.007,
                        decoration: BoxDecoration(
                          color: lineColors(controller.currentIndex.value),
                          borderRadius: BorderRadius.only(
                            topRight:
                                Radius.elliptical(width * 0.1, height * 0.02),
                            topLeft:
                                Radius.elliptical(width * 0.1, height * 0.02),
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height - 267,
                        //   width: double.infinity,
                        //   child: GetBuilder<CustomTabController>(
                        //       init: controller,
                        //       builder: (_) {
                        //         return [
                        //           Image.asset(
                        //             Assets.googleMap,
                        //             fit: BoxFit.cover,
                        //           ),
                        //           Image.asset(
                        //             Assets.googleMap,
                        //             fit: BoxFit.cover,
                        //           ),
                        //           Image.asset(
                        //             Assets.googleMap,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ][controller.currentIndex.value];
                        //       }),
                        // ),
                        Positioned(
                          top: height * 0.318,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 250,
                            width: double.infinity,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: _kGooglePlex,
                              compassEnabled: false,
                              myLocationEnabled: true,
                              markers: Set<Marker>.of(_marker),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                          ),
                        ),

                        Positioned(
                          left: 0,
                          bottom: 10.h,
                          right: 0,
                          child: Obx(() => Offstage(
                                offstage: controller.isHide.value,
                                child: Container(
                                  padding: EdgeInsets.all(10.h),
                                  height: height * .18,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount: gridItems.length,
                                            shrinkWrap: true,
                                            primary: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return CategoriesCard(
                                                  title: gridItems[index]
                                                      ['title'],
                                                  subtitle: gridItems[index]
                                                      ['subtitle'],
                                                  status: gridItems[index]
                                                      ['status'],
                                                  color: borderSidecolor[index],
                                                  asset: gridItems[index]
                                                      ['image'],
                                                  onTap: () => Get.to(() =>
                                                      const ViewAllPlacesScreen()));
                                            }),
                                      ),
                                      3.horizontalSpace,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () => Get.to(() =>
                                                  const ViewAllPlacesScreen()),
                                              icon: SvgPicture.asset(
                                                Assets.sliderIcon,
                                                height: 25.h,
                                              )),
                                          Text(
                                            'View All',
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.blackColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  Widget _buildBusyPlacesItem(
      {required String title,
      required int index,
      required bool isSelected,
      required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          height: 50.h,
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : AppColors.white,
            border: Border(
              right: BorderSide(
                color: const Color(0xffC5C5C5).withOpacity(0.3),
                width: 2,
              ),
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(36.r)),
          ),
          child: Center(
            child: Text(
              title,
              textScaleFactor: 0.9,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.white : AppColors.orangeColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAllTab(
      {required String title,
      required int index,
      required bool isSelected,
      required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          height: 50.h,
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : Colors.white,
            border: Border(
              right: BorderSide(
                color: const Color(0xffC5C5C5).withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              textScaleFactor: 0.9,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.white : AppColors.green),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuitPlacesTab(
      {required String title,
      required int index,
      required bool isSelected,
      required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          height: 50.h,
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : AppColors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(36.r)),
          ),
          child: Center(
            child: Text(
              title,
              textScaleFactor: 0.9,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? AppColors.white : const Color(0xff50555C)),
            ),
          ),
        ),
      ),
    );
  }
}
