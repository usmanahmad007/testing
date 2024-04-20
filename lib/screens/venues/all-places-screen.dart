import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/favourite-card.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';

class ViewAllPlacesScreen extends StatefulWidget {
  const ViewAllPlacesScreen({super.key});

  @override
  State<ViewAllPlacesScreen> createState() => _ViewAllPlacesScreenState();
}

class _ViewAllPlacesScreenState extends State<ViewAllPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'View All Places',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFieldWidget(
                hintText: 'Search for Places',
                preffixIcon: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    Assets.search,
                    color: AppColors.blackColor,
                    height: 10.h,
                  ),
                ),
                suffixIcon: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    Assets.voiceIcon,
                    color: AppColors.blackColor,
                    height: 10.h,
                  ),
                ),
              ),
              10.verticalSpace,
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) {
                      return const FavouriteCard();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
