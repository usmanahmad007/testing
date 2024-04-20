import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/my-venues-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/favourites-screen.dart';
import 'package:nomo_app/screens/locations/add-location-screen.dart';
import 'package:nomo_app/screens/venues/myVenues/tabs/approved-venues.dart';
import 'package:nomo_app/screens/venues/myVenues/tabs/my-all-venues-screen.dart';
import 'package:nomo_app/screens/venues/myVenues/tabs/my-rejected-venues.dart';
import 'package:nomo_app/screens/venues/myVenues/tabs/pending-venues-screen.dart';

class MyVenuesScreen extends StatefulWidget {
  const MyVenuesScreen({super.key});

  @override
  State<MyVenuesScreen> createState() => _MyVenuesScreenState();
}

class _MyVenuesScreenState extends State<MyVenuesScreen> {
  final List<String> labels = ['All', 'Publish', 'Pending', 'Rejected'];
  bool _isSearching = false;
  final MyVenuesTabController myVenuesTabController =
      Get.put(MyVenuesTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
        title: _isSearching
            ? SearchFieldWidget(
                hintText: 'Search',
                filledColor: AppColors.white,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.voiceIcon,
                      color: AppColors.blackColor,
                    )),
                preffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.search,
                      color: AppColors.blackColor,
                    )))
            : const Text(
                'My Venues',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientColor),
        ),
        automaticallyImplyLeading: false,
        leading: _isSearching
            ? null
            : IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(Assets.arrowBack)),
        actions: <Widget>[
          if (!_isSearching)
            IconButton(
              icon: SvgPicture.asset(Assets.search),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                });
              },
            ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          createVenueRowWidget(),
          Divider(
            color: const Color(0xff50555C).withOpacity(0.18),
          ),
          10.verticalSpace,
          GetBuilder<MyVenuesTabController>(
            init: MyVenuesTabController(),
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(top: 13, left: 10),
                // height: 50,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                width: double.infinity,
                margin: const EdgeInsets.only(right: 20, left: 20),

                decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < labels.length; i++)
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.setCurrentIndex = i,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin:
                                    const EdgeInsets.only(right: 6, left: 6),
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == i
                                      ? AppColors.blackColor
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  labels[i],
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: controller.currentIndex.value == i
                                          ? Colors.white
                                          : AppColors.blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              8.verticalSpace,
                              Container(
                                  height: 3.5,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: controller.currentIndex.value == i
                                        ? AppColors.green
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.elliptical(40, 20),
                                        topRight: Radius.elliptical(40, 20)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    // if (i == 0)
                    const SizedBox(width: 12),
                  ],
                ),
              );
            },
          ),
          15.verticalSpace,
          _tabBarViews()
        ],
      ),
    );
  }

  Widget _tabBarViews() {
    return GetBuilder<MyVenuesTabController>(
      init: myVenuesTabController,
      builder: (_) {
        return [
          const Expanded(child: MyAllVenues()),
          const Expanded(child: MyApprovedVenues()),
          const Expanded(child: PendingVenues()),
          const Expanded(child: MyRejectedVenues()),
        ][myVenuesTabController.currentIndex.value];
      },
    );
  }

  Widget createVenueRowWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 23, 25, 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(() => const AddVenueScreen());
              },
              splashColor: Colors.grey.shade100.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              child: Ink(
                height: 43,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: AppColors.gradientColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors.neutralGray)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    10.horizontalSpace,
                    const Text(
                      'Create Venues',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: AppColors.white,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          20.horizontalSpace,
          Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const FavouritesScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.locationPin,
                      height: 22,
                    ),
                    8.horizontalSpace,
                    const Text(
                      'Favorite Venues',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          color: AppColors.blackColor,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
