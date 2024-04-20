import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/gallery-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/components/gallery-tabs-widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/gallery/gallery-screen.dart';

class GalleryTabs extends StatefulWidget {
  const GalleryTabs({super.key});

  @override
  _GalleryTabsState createState() => _GalleryTabsState();
}

class _GalleryTabsState extends State<GalleryTabs> {
  final GalleryTabController galleryTabController =
      Get.put(GalleryTabController());
  // late TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 4, vsync: this);
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  List<String> nameList = [
    'All',
    'Hotel Views',
    'Guest Room',
    'Suites',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Gallery',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Column(
        children: <Widget>[
          GetBuilder<GalleryTabController>(
              init: galleryTabController,
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: GalleryTabButton(
                        title: 'All',
                        isSelected:
                            galleryTabController.currentIndex.value == 0,
                        onTap: () => galleryTabController.setCurrentIndex = 0,
                        index: 0,
                      )),
                      5.horizontalSpace,
                      Expanded(
                          flex: 2,
                          child: GalleryTabButton(
                            title: 'Hotel Views',
                            isSelected:
                                galleryTabController.currentIndex.value == 1,
                            onTap: () =>
                                galleryTabController.setCurrentIndex = 1,
                            index: 1,
                          )),
                      5.horizontalSpace,
                      Expanded(
                          flex: 2,
                          child: GalleryTabButton(
                            title: 'Guest Room',
                            isSelected:
                                galleryTabController.currentIndex.value == 2,
                            onTap: () =>
                                galleryTabController.setCurrentIndex = 2,
                            index: 2,
                          )),
                      5.horizontalSpace,
                      Expanded(
                          flex: 2,
                          child: GalleryTabButton(
                            title: 'Suites',
                            isSelected:
                                galleryTabController.currentIndex.value == 3,
                            onTap: () =>
                                galleryTabController.setCurrentIndex = 3,
                            index: 3,
                          )),
                    ],
                  ),
                );
              }),
          GetBuilder<GalleryTabController>(
              init: galleryTabController,
              builder: (_) {
                return [
                  Expanded(child: GalleryScreen()),
                  Container(),
                  Container(),
                  Container(),
                ][galleryTabController.currentIndex.value];
              }),
        ],
      ),
    );
  }
}
