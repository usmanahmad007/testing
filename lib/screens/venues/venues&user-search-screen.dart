import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/custom-list-view-widget.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/explore/explore.dart';
import 'package:nomo_app/screens/users-screen.dart';
import 'dart:math' as math;

class VenueSearchView extends StatefulWidget {
  const VenueSearchView({super.key});

  @override
  State<VenueSearchView> createState() => _VenueSearchViewState();
}

class _VenueSearchViewState extends State<VenueSearchView> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map> venuesList = [
    {
      "image": Assets.grandHotel,
      "text": "Grand Hotel",
    },
    {
      "image": Assets.royalVila,
      "text": "Royal Vila",
    },
    {
      "image": Assets.greenVila,
      "text": "Resort",
    },
    {
      "image": Assets.royalVila,
      "text": "Grand Hotel",
    },
    {
      "image": Assets.greenVila,
      "text": "Royal Vila",
    },
    {
      "image": Assets.royalVila,
      "text": "Resort",
    },
    {
      "image": Assets.greenVila,
      "text": "Grand Hotel",
    },
  ];

  final List<Map> usersList = [
    {
      "image": Assets.follower1,
      "text": "John Wick",
    },
    {
      "image": Assets.follower2,
      "text": "John",
    },
    {
      "image": Assets.follower3,
      "text": "Robert",
    },
    {
      "image": Assets.follower4,
      "text": "Robert Wood",
    },
    {
      "image": Assets.follower5,
      "text": "Frenklin",
    },
    {
      "image": Assets.follower6,
      "text": "Triver",
    },
    {
      "image": Assets.follower7,
      "text": "Micheal",
    },
  ];

  List<Map> filteredVenuesList = [];
  List<Map> filteredUsersList = [];

  @override
  void initState() {
    super.initState();
    filteredVenuesList = venuesList;
    filteredUsersList = usersList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.verticalSpace,
          textFieldWidgetView(),
          venuesListWidgetView(filteredVenuesList),
          10.verticalSpace,
          usersListWidgetView(filteredUsersList),
        ],
      ),
    );
  }

  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<String> _locationSuggestions = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Spain',
    'Canada',
    'Poland',
    'Thailand',
  ];

  Widget textFieldWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _locationSuggestions.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return SearchFieldWidget(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onChanged: (value) {
                      _onSearchTextChanged(value);
                      return null;
                    },
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
                    hintText: 'Type to search..');
              },
              optionsViewBuilder: (context, onSelected, options) {
                return CustomListViewWidget(
                  scrollController: _scrollController,
                  options: _locationSuggestions,
                  onSelected: (String option) {},
                );
              },
              onSelected: (String selection) {},
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              _searchController.clear();
              _onSearchTextChanged('');
            },
            child: const Icon(Icons.close,
                color: AppColors.kBlackColor2, size: 24),
          ),
        ],
      ),
    );
  }

  void _onSearchTextChanged(String searchText) {
    filteredVenuesList = venuesList.where((venue) {
      return venue['text'].toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    filteredUsersList = usersList.where((user) {
      return user['text'].toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    setState(() {});
  }

  Widget venuesListWidgetView(List<Map> venuesList) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    double cardWidth = MediaQuery.of(context).size.width;
    double cardAspectRatio = 2.9;
    int itemCount = math.max(0, venuesList.length - 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Venues",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2A37)),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 145,
          width: cardWidth,
          child: GridView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 25, right: 15, top: 5, bottom: 5),
            itemCount: itemCount,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: cardAspectRatio,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) => Container(
              width: cardWidth,
              height: 80,
              // constraints: const BoxConstraints(maxHeight: double.infinity),
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                      venuesList[index]["image"],
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        venuesList[index]["text"],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      3.verticalSpace,
                      Row(
                        children: [
                          const Text(
                            'Open Now',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.green),
                          ),
                          5.horizontalSpace,
                          const Text(
                            '2.4 km',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.neutralGray),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: GradientElevatedButton(
              gradient: AppColors.gradientColor,
              width: 280.w,
              label: 'View More',
              onPressed: () {
                Get.to(() => ExploreScreen());
              }),
        ),
      ],
    );
  }

  Widget usersListWidgetView(List<Map> usersList) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    double cardWidth = MediaQuery.of(context).size.width;
    double cardAspectRatio = 2.7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Users',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2A37)),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          width: cardWidth,
          child: GridView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 25, right: 15, top: 5, bottom: 5),
            itemCount: usersList.length - 3,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: cardAspectRatio,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) => Container(
              width: cardWidth,
              height: 80,
              // constraints: const BoxConstraints(maxHeight: double.infinity),
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.green,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(
                        usersList[index]["image"],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        usersList[index]["text"],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.verticalSpace,
                      const Text(
                        '@darrell _stew',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff50555C)),
                      ),
                      2.verticalSpace,
                      const Text(
                        '10 Mutual Friends',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff50555C)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: GradientElevatedButton(
              gradient: AppColors.gradientColor,
              width: 280.w,
              label: 'View More',
              onPressed: () {
                Get.to(() => UsersScreen(
                      filteredUsersList: filteredUsersList,
                      searchText: _searchController.text,
                    ));
              }),
        ),
      ],
    );
  }
}

Widget buildButton({required String title, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.3),
                offset: const Offset(0, 3),
                spreadRadius: 0,
                blurRadius: 4)
          ]),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
