// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/stories-tab-controller.dart';

import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/res/components/stories/discover-stories-widget.dart';
import 'package:nomo_app/res/components/stories/friends-stories.dart';
import 'package:nomo_app/screens/storyScreen/own-story-screen.dart';

class StoriesSection extends StatefulWidget {
  const StoriesSection({super.key});

  @override
  State<StoriesSection> createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection>
    with SingleTickerProviderStateMixin {
  String text = "My Story";

  String label = "Help & Support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Stories',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack)),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage(Assets.follower2),
              ),
            ),
            12.horizontalSpace
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              10.verticalSpace,
              SearchFieldWidget(
                  preffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.search,
                      color: AppColors.blackColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.voiceIcon,
                      color: AppColors.blackColor,
                    ),
                  ),
                  hintText: 'Search for Friends'),
              25.verticalSpace,
              Text(
                label,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff1F2A37),
                    fontWeight: FontWeight.w600),
              ),
              16.verticalSpace,
              storyCard(),
              20.verticalSpace,
              GetBuilder<StoriesTabController>(
                init: StoriesTabController(),
                builder: (controller) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 12),
                    // height: 50,
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Expanded(
                            child: InkWell(
                              onTap: () => controller.setCurrentIndex = i,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 51,
                                    decoration: BoxDecoration(
                                      color: controller.currentIndex.value == i
                                          ? AppColors.blackColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      i == 0 ? 'Friends' : 'Discover',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              controller.currentIndex.value == i
                                                  ? Colors.white
                                                  : AppColors.blackColor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                      height: 4,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color:
                                            controller.currentIndex.value == i
                                                ? AppColors.green
                                                : Colors.transparent,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.elliptical(40, 20),
                                            topRight:
                                                Radius.elliptical(40, 20)),
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
              _tabBarViews()
            ],
          ),
        ));
  }

  Widget storyCard() {
    return InkWell(
      onTap: () {
        Get.to(() => const OwnStoryScreen());
      },
      borderRadius: BorderRadius.circular(5.r),
      splashColor: Colors.grey.shade100,
      child: Ink(
        padding: const EdgeInsets.all(8.0),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffF8F8F8),
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: const Color(0xffCDCDCD), width: 0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const StoryAvatar(
                    image: AssetImage(Assets.follower5),
                    numberOfStories: 5,
                    hasUnviewedStories: true),
                12.horizontalSpace,
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(Assets.down)),
          ],
        ),
      ),
    );
  }

  Widget _tabBarViews() {
    return GetBuilder<StoriesTabController>(
        init: StoriesTabController(),
        builder: (controller) {
          return [
            const Expanded(
              child: FriendsStories(),
            ),
            const Expanded(child: DiscoverStories()),
          ][controller.currentIndex.value];
        });
  }
}

class StoryAvatar extends StatelessWidget {
  final ImageProvider image;
  final int numberOfStories;
  final bool hasUnviewedStories;

  const StoryAvatar({
    super.key,
    required this.image,
    required this.numberOfStories,
    this.hasUnviewedStories = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter:
              DottedBorder(numberOfStories: numberOfStories, spaceLength: 4),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => const StoryPageView(
                //       isUserStoryOwner: true,
                //     ));
              },
              child: CircleAvatar(radius: 25, backgroundImage: image),
            ),
          ),
        ),
      ],
    );
  }
}

class DottedBorder extends CustomPainter {
  final int numberOfStories;

  final int spaceLength;

  double startOfArcInDegree = 0;

  DottedBorder({required this.numberOfStories, this.spaceLength = 10});

  double inRads(double degree) {
    return (degree * pi) / 180;
  }

  @override
  bool shouldRepaint(DottedBorder oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double arcLength =
        (360 - (numberOfStories * spaceLength)) / numberOfStories;

    if (arcLength <= 0) {
      arcLength = 360 / spaceLength - 1;
    }

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (int i = 0; i < numberOfStories; i++) {
      //printing the arc
      canvas.drawArc(
          rect,
          inRads(startOfArcInDegree),
          inRads(arcLength),
          false,
          Paint()
            ..color = i == 0 || i == 1 ? Colors.grey : AppColors.green
            ..strokeWidth = 3.0
            ..style = PaintingStyle.stroke);

      startOfArcInDegree += arcLength + spaceLength;
    }
  }
}
