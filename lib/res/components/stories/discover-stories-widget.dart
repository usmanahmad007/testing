import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/storyScreen/story-page-view.dart';

class DiscoverStories extends StatefulWidget {
  const DiscoverStories({super.key});

  @override
  State<DiscoverStories> createState() => _DiscoverStoriesState();
}

class _DiscoverStoriesState extends State<DiscoverStories> {
  final List<Map> discoverList = [
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower1,
      "text": "Robert Fox",
    },
    {
      "image1": Assets.royalVila,
      "image2": Assets.follower2,
      "text": "Howard",
    },
    {
      "image1": Assets.greenVila,
      "image2": Assets.follower3,
      "text": "Leslie Alex..",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower4,
      "text": "Ronald Rich..",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower1,
      "text": "Jenny Wilson",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower6,
      "text": "Devon Lane",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower1,
      "text": "Arlene McCoy",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower7,
      "text": "Savannah Ng..",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower5,
      "text": "Cameron Willi..",
    },
    {
      "image1": Assets.grandHotel,
      "image2": Assets.follower1,
      "text": "Robert Fox",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2.1 / 1,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      itemCount: discoverList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => const StoryPageView(isUserStoryOwner: false));
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(discoverList[index]["image1"]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage(
                            discoverList[index]["image2"],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          discoverList[index]["text"],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
