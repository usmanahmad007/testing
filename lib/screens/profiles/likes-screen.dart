import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/follower-card-widget.dart';

import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  final TextEditingController controller = TextEditingController();
  List<String> nameList = [
    'Darrell Steward',
    'Robert Fox',
    'Wade Warren',
    'Kristin Watson',
    'Marvin McKinney',
    'Savannah Nguyen',
    'Guy Hawkins'
  ];

  List<String> imagesList = [
    Assets.follower1,
    Assets.follower2,
    Assets.follower3,
    Assets.follower4,
    Assets.follower5,
    Assets.follower6,
    Assets.follower7,
  ];

  Widget textFieldWidgetView() {
    return SearchFieldWidget(
        preffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
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
        hintText: 'Find Friends');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Likes',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.editProfileIcon)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.settings)),
          10.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFieldWidgetView(),
            10.verticalSpace,
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return FollowerCardWidget(
                      name: nameList[index],
                      images: imagesList[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
