import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/venues/venue-detail-screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Favorites',
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                hintText: 'Search for Favorites'),
            12.verticalSpace,
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return buildVenueCard();
                  }),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget buildVenueCard() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const VenueDetailScreen());
      },
      child: Container(
        // height: 90.h,
        constraints: const BoxConstraints(maxHeight: double.infinity),
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  color: AppColors.neutralGray.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 75.h,
                width: 110.w,
                margin: const EdgeInsets.only(left: 6, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(Assets.resortImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Nature Pure, Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: "Montserrat"),
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Assets.locationBlack),
                          5.horizontalSpace,
                          const Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color(0xff6F6E6E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xffFFC107),
                            size: 20,
                          ),
                          3.horizontalSpace,
                          const Text(
                            '4.7',
                            style: TextStyle(
                                color: Color(0xff6F6E6E),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
