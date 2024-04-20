import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/storyScreen/story-page-view.dart';

class OwnStoryScreen extends StatefulWidget {
  const OwnStoryScreen({super.key});

  @override
  State<OwnStoryScreen> createState() => _OwnStoryScreenState();
}

class _OwnStoryScreenState extends State<OwnStoryScreen> {
  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/delete-sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Own Story',
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
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
        child: Column(
          children: [
            builtStoriesViewsWidget(text: '15 views', time: '2 mins ago'),
            10.verticalSpace,
            builtStoriesViewsWidget(text: '9 views', time: '1 hour ago'),
            10.verticalSpace,
            builtStoriesViewsWidget(text: '5 views', time: '20 mins ago'),
            80.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: _addStoryButton(
                  label: 'Add New Story',
                  onPressed: () {},
                  width: double.infinity),
            )
          ],
        ),
      ),
    );
  }

  Widget builtStoriesViewsWidget({required String text, required String time}) {
    return InkWell(
      onTap: () {
        Get.to(() => const StoryPageView(
              isUserStoryOwner: true,
            ));
      },
      splashColor: Colors.grey.shade100,
      child: Ink(
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.follower5),
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor),
                    ),
                    5.verticalSpace,
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff50555C)),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              flex: 0,
              child: Theme(
                data: Theme.of(context).copyWith(
                  popupMenuTheme: PopupMenuThemeData(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: AppColors.neutralGray, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0.5,
                  ),
                ),
                child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  color: AppColors.white,
                  icon:
                      const Icon(Icons.more_vert, color: AppColors.blackColor),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        onTap: () async {
                          await playSound();
                        },
                        value: 'delete',
                        child: Container(
                          height: 43,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              gradient: AppColors.gradientColor),
                          child: const Center(
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  onSelected: (String value) {
                    print('You Click on pop up menu item');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addStoryButton(
      {required final String label,
      var width = 100,
      required VoidCallback onPressed}) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: AppColors.gradientColor),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.plus,
              height: 20,
            ),
            10.horizontalSpace,
            Text(
              label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}
