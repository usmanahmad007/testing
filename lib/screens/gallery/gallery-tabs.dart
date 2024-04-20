import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/gallery-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/gallery/laptops-categories.dart';
import 'package:nomo_app/screens/gallery/mobile-phone-category.dart';

class GalleryTabsScreen extends StatelessWidget {
  GalleryTabsScreen({Key? key}) : super(key: key);

  final GalleryTabController galleryTabController =
      Get.put(GalleryTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Gallery',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// TextField Widget View
            TextFieldWidgetView(),
            const SizedBox(height: 20),

            /// Tab Widget View
            TabWidgetView(),
            const SizedBox(height: 20),

            /// TabBar Fabs Widget View
            Expanded(child: TabBarFabsWidgetView()),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  /// TextField Widget View
  Widget TextFieldWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              flex: 6, child: SearchFieldWidget(hintText: 'Type to search..')),
          const SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close,
                  color: AppColors.kBlackColor2, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  /// Tab Widget View
  Widget TabWidgetView() {
    return TabBar(
      tabs: galleryTabController.myTabs,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: AppColors.neutralGray,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelColor: AppColors.blackColor,
      controller: galleryTabController.controller,
      indicatorColor: AppColors.neutralGray,
      indicatorWeight: 3,
    );
  }

  /// TabBar Fabs Widget View
  Widget TabBarFabsWidgetView() {
    return TabBarView(
      controller: galleryTabController.controller,
      children: [LaptopsCategory(), MobileCategory()],
    );
  }
}
