// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/search-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/custom-list-view-widget.dart';
import 'package:nomo_app/res/components/post-card-widget.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/res/components/searched-venue-card.dart';
import 'package:nomo_app/screens/locations/add-location-screen.dart';
import 'package:nomo_app/screens/venues/venues&user-search-screen.dart';

searchPlaces(BuildContext context) {
  final ScrollController scrollController = ScrollController();

  final List<String> locationSuggestions = [
    'Grand Mercure Hotel and Residences...',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Spain',
    'Canada',
    'Poland',
    'Thailand',
  ];

  final List<Map<String, String>> categoryItems = [
    {'icon': Assets.favourite, 'title': 'Favorities', 'color': '#FF0000'},
    {'icon': Assets.branch, 'title': 'Brunches', 'color': '#000000'},
    {'icon': Assets.nightLife, 'title': 'Night Life', 'color': '#000000'},
  ];

  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  double screenHeight = MediaQuery.sizeOf(context).height;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return AnimatedOpacity(
          opacity: 1.0, // Target opacity
          duration: const Duration(milliseconds: 500),

          child: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 13.h),
                    height: screenHeight * .9,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.w, 0, 30.w, 10.h),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Autocomplete<String>(
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return locationSuggestions
                                          .where((String option) {
                                        return option.contains(textEditingValue
                                            .text
                                            .toLowerCase());
                                      });
                                    },
                                    fieldViewBuilder: (context,
                                        textEditingController,
                                        focusNode,
                                        onFieldSubmitted) {
                                      return SearchFieldWidget(
                                          onTap: () =>
                                              searchVenuesAndUsers(context),
                                          controller: textEditingController,
                                          hintText: 'Search for Places',
                                          focusNode: focusNode,
                                          // readOnly: true,
                                          suffixIcon: Transform.scale(
                                            scale: 0.4,
                                            child: SvgPicture.asset(
                                              Assets.voiceIcon,
                                              color: AppColors.blackColor,
                                              height: 10.h,
                                            ),
                                          ),
                                          preffixIcon: Transform.scale(
                                            scale: 0.4,
                                            child: SvgPicture.asset(
                                              Assets.search,
                                              color: AppColors.blackColor,
                                              height: 10.h,
                                            ),
                                          ));
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return CustomListViewWidget(
                                        scrollController: scrollController,
                                        options: locationSuggestions,
                                        onSelected: (String option) {
                                          // Handle option selection
                                          print('Selected: $option');
                                        },
                                      );
                                    },
                                    onSelected: (String selection) {
                                      // Handle selection
                                      print('You just selected $selection');
                                    },
                                  ),
                                ),
                                10.horizontalSpace,
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: SvgPicture.asset(
                                    Assets.cancel,
                                    color: AppColors.blackColor,
                                    height: 10.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                          7.verticalSpace,
                          GetBuilder(
                              init: SearchTabController(),
                              builder: (searchTabController) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: MediaQuery.of(context).size.height *
                                      0.042,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      shrinkWrap: true,
                                      itemCount: categoryItems.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        Color iconColor = hexToColor(
                                            categoryItems[index]['color']!);
                                        return categoryButtons(
                                            assets: categoryItems[index]
                                                ['icon'],
                                            title: categoryItems[index]
                                                ['title'],
                                            onTap: () => searchTabController
                                                .setCurrentIndex = index,
                                            color: iconColor);
                                      }),
                                );
                              }),
                          10.verticalSpace,
                          _tabBarViews(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                right: 20,
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const AddVenueScreen());
                    },
                    icon: SvgPicture.asset(
                      Assets.addVenue,
                      height: 60,
                    )),
              )
            ],
          ),
        );
      },
      transitionAnimationController: AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: Navigator.of(context),
      ));
}

Widget _tabBarViews() {
  return GetBuilder<SearchTabController>(builder: (searchTabController) {
    return [
      SearchFavScreen(),
      SizedBox(
        height: 200.h,
        width: double.infinity,
        child: const Center(
          child: Text('Tab 2'),
        ),
      ),
      SizedBox(
        height: 200.h,
        width: double.infinity,
        child: const Center(
          child: Text('Tab 3'),
        ),
      ),
    ][searchTabController.currentIndex.value];
  });
}

void searchVenuesAndUsers(BuildContext context) {
  double screenHeight = MediaQuery.sizeOf(context).height;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    // padding: EdgeInsets.only(top: 13.h),
                    height: screenHeight * .9,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    child: const VenueSearchView())));
      });
}

Widget categoryButtons(
    {required String? assets,
    required String? title,
    required Color color,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(right: 10),
      height: 30.h,
      width: 120.w,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(assets!, height: 18.h, color: color)),
          8.horizontalSpace,
          Text(title!,
              style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat')),
        ],
      ),
    ),
  );
}

class SearchFavScreen extends StatefulWidget {
  const SearchFavScreen({super.key});

  @override
  State<SearchFavScreen> createState() => _SearchFavScreenState();
}

class _SearchFavScreenState extends State<SearchFavScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ListView.builder(
          itemCount: 10,
          // physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 250),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (context, index) {
            if (index < 3) {
              return const SearchedVenueCardWidget();
            } else {
              return const PostCardWidget();
            }
          }),
    );
  }
}
