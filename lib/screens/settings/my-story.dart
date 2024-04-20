import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/contact-me-controller.dart';
import 'package:nomo_app/controllers/location-controller.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class MyStoryScreen extends StatelessWidget {
  MyStoryScreen({Key? key}) : super(key: key);

  final MyLocationController myLocationController =
      Get.put(MyLocationController());

  final List<Map> mystoryList = [
    {
      "text": "Everyone",
    },
    {
      "text": "Friends Only",
    },
    {
      "text": "Custom",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back,
                color: AppColors.black2A3, size: 24),
          ),
        ),
        title: Text(
          'My Story',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'Montserrat',
              color: AppColors.black2A3,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            children: [
              /// Top Widget View
              TopWidgetView(),
              const SizedBox(height: 50),

              /// List Widget View
              ListWidgetView(),
            ],
          ),
        ),
      ),
    );
  }

  /// Top Widget View
  Widget TopWidgetView() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: "Who can view my story?",
        style: TextStyle(
          fontSize: 14,
          color: AppColors.black2A3,
        ),
        children: <TextSpan>[],
      ),
    );
  }

  /// List Widget View
  Widget ListWidgetView() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: mystoryList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mystoryList[index]["text"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      color: AppColors.black2A3,
                      fontWeight: FontWeight.w600),
                ),
                GetBuilder<MyLocationController>(
                  init: MyLocationController(),
                  builder: (controller) => InkWell(
                    onTap: () {
                      controller.onIndexChange(index);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: controller.selectedIndex == index
                                ? AppColors.green
                                : AppColors.black2A3,
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
            const SizedBox(height: 20),
            const Divider(thickness: 1, color: AppColors.neutralGray),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
