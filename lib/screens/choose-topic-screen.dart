import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/choose-topic-controller.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class ChooseTopicScreen extends StatelessWidget {
  ChooseTopicScreen({Key? key}) : super(key: key);

  final ChooseTopicController chooseTopicController =
      Get.put(ChooseTopicController());

  final List<Map> chooseTopicList = [
    // {
    //   "text": "“Send To” Screen",
    // },
    {
      "text": "Topic 1",
    },
    {
      "text": "Topic 2",
    },
    {
      "text": "Topic 3",
    },
    {
      "text": "Topic 4",
    },
    {
      "text": "Topic 5",
    },
    // {
    //   "text": "Editing a Snap",
    // },
    // {
    //   "text": "Face Lenses",
    // },
    // {
    //   "text": "Filters",
    // },
    // {
    //   "text": "Flash",
    // },
    // {
    //   "text": "GIPHY",
    // },
    // {
    //   "text": "Photo or Video Quality",
    // },
    // {
    //   "text": "Stickers",
    // },
    // {
    //   "text": "Taking a Snap",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        title: 'Topics',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: ListWidgetView(),
    );
  }

  /// List widget View
  Widget ListWidgetView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Text(
            'Choose Topic',
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff0D120E),
                fontWeight: FontWeight.w600),
          ),
          20.verticalSpace,
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: chooseTopicList.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chooseTopicList[index]['text'],
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'Montserrat',
                              color: const Color(0xff0D120E),
                              fontWeight: FontWeight.w600),
                        ),
                        GetBuilder<ChooseTopicController>(
                          init: ChooseTopicController(),
                          builder: (controller) => InkWell(
                            onTap: () {
                              controller.onIndexChange(index);
                            },
                            child: Container(
                              height: 17.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                border: Border.all(
                                    color: controller.selectedIndex == index
                                        ? AppColors.green
                                        : AppColors.neutralGray,
                                    width: 1),
                                color: controller.selectedIndex == index
                                    ? AppColors.green
                                    : AppColors.white,
                              ),
                              child: controller.selectedIndex == index
                                  ? const Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                      size: 18,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    const Divider(thickness: 1, color: Colors.grey),
                    12.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
