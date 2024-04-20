// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/follow-button-widget.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';

class UsersScreen extends StatefulWidget {
  final List<Map> filteredUsersList;
  final String searchText;
  const UsersScreen(
      {super.key, required this.filteredUsersList, required this.searchText});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  TextEditingController controller = TextEditingController();

  late List<Map> displayedUsersList;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.searchText);
    displayedUsersList = widget.filteredUsersList;
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Users',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.follower1),
          ),
          15.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          10.verticalSpace,
          textFieldWidgetView(),
          10.verticalSpace,
          usersListWidgetView(),
          40.verticalSpace,
        ],
      ),
    );
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
          onChanged: (value) {
            _onSearchTextChanged(value);
            return null;
          },
          controller: controller,
          hintText: 'Find Friends'),
    );
  }

  void _onSearchTextChanged(String searchText) {
    setState(() {
      displayedUsersList = widget.filteredUsersList.where((user) {
        return user['text'].toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    });
  }

  Widget usersListWidgetView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        itemCount: displayedUsersList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Container(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 20),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.08),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(-1, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.green,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        displayedUsersList[index]["image"],
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayedUsersList[index]["text"],
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff09101D)),
                      ),
                      5.verticalSpace,
                      const Text(
                        '@darrell _stew',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff50555C)),
                      ),
                      5.verticalSpace,
                      const Text(
                        '10 Mutual Friends',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff50555C)),
                      ),
                    ],
                  ),
                ],
              ),
              FollowButton(
                width: 80.w,
                text: 'Follow',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
