// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatefulWidget {
  final bool isUserStoryOwner;
  const StoryPageView({super.key, required this.isUserStoryOwner});

  @override
  State<StoryPageView> createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  final StoryController storyController = StoryController();
  // bool? isUserStory = false;

  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;
  bool _isLoading = false;
  bool _isSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: Stack(
        children: [
          StoryView(
            storyItems: [
              StoryItem.text(
                  title: 'Hello, Mam Keerio', backgroundColor: AppColors.green),
              StoryItem.pageImage(url: dummyImg1, controller: storyController),
              StoryItem.pageImage(url: dummyImg, controller: storyController),
              StoryItem.pageImage(url: dummyImg2, controller: storyController),
              StoryItem.pageImage(url: dummyImg3, controller: storyController),
            ],
            inline: false,
            repeat: false,
            controller: storyController,
          ),
          widget.isUserStoryOwner
              ? Positioned(
                  top: 70,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset(
                              Assets.cancel,
                              color: AppColors.white,
                              height: 30,
                            ),
                          )),
                      deleteButton(onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return logoutDialog();
                            });
                      }),
                    ],
                  ),
                )
              : Container(),
          widget.isUserStoryOwner
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          buildViewsBottomSheet();
                        },
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          color: AppColors.blackColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.lock,
                                color: AppColors.white,
                                height: 12,
                              ),
                              10.horizontalSpace,
                              Text(
                                '3',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : _buildReplyField()
        ],
      )),
    );
  }

  Positioned _buildReplyField() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          height: 79,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: const BoxDecoration(
            color: Colors.black, // Set the color to black
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Send message",
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 10),
                      fillColor: AppColors.white,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff50555C)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none)),
                  onChanged: (value) {
                    setState(() {
                      _isTyping = value.isNotEmpty;
                    });
                  },
                ),
              ),
              10.horizontalSpace,
              Expanded(
                  flex: 0,
                  child: _isTyping || _isSent
                      ? sendButton(
                          onTap: () {
                            if (!_isLoading) {
                              setState(() {
                                _isLoading = true;
                              });
                              // Simulate network call
                              Timer(const Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading = false;
                                  _isSent = true;
                                });
                                // Auto-hide checkmark after few seconds
                                Timer(const Duration(seconds: 2), () {
                                  setState(() {
                                    _isSent = false;
                                    _controller.clear();
                                  });
                                });
                              });
                            }
                          },
                          isLoading: _isLoading,
                          isSent: _isSent)
                      : const Text(''))
            ],
          ),
        ),
      ),
    );
  }

  Future buildViewsBottomSheet() {
    final List<Map<String, dynamic>> viewersList = [
      {
        "image2": Assets.follower1,
        "text": "Robert Fox",
        'time': 'Just Now',
      },
      {
        "image2": Assets.follower2,
        "text": "Howard",
        'time': '5 mints ago',
      },
      {
        "image2": Assets.follower3,
        "text": "Leslie Alex..",
        'time': '1 hour ',
      },
      {
        "image2": Assets.follower4,
        "text": "John ",
        'time': '5 hour ',
      },
    ];
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            height: MediaQuery.sizeOf(context).height * .4,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Viewed by 3',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ),
                      // IconButton(
                      //   icon: const Icon(Icons.close),
                      //   onPressed: () => Navigator.pop(context),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Flexible(
                    child: ListView.builder(
                        itemCount: viewersList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ViewsListTile(
                            image: viewersList[index]['image2'],
                            time: viewersList[index]['time'],
                            name: viewersList[index]['text'],
                          );
                        }))
              ],
            ),
          ),
        );
      },
    );
  }

  // Story Delete Button
  Widget deleteButton({required VoidCallback onTap}) {
    return Container(
      height: 38,
      width: 78,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: AppColors.white),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 18, right: 12),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onTap,
        child: const Text(
          'Delete',
          style: TextStyle(
              fontSize: 10,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}

// Send Button
Widget sendButton(
    {required VoidCallback onTap,
    required bool isLoading,
    required bool isSent}) {
  return Container(
    height: 45,
    width: 91,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: AppColors.gradientColor),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 18, right: 12),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: onTap,
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : (isSent
              ? const Icon(Icons.check, color: Colors.white)
              : const Text(
                  'Send',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                )),
    ),
  );
}

class ViewsListTile extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  const ViewsListTile(
      {super.key, required this.image, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),
      title: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        time,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
