import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/booking-widgets/hosted-by.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/common-image-view.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/icon-tile.dart';
import 'package:nomo_app/res/components/review-box.dart';

class PreviewListing extends StatelessWidget {
  final List<Map<String, dynamic>> hotelSpecifications = [
    {
      'icon': Assets.imagesBed,
      'spec': '2 Bedroom',
    },
    {
      'icon': Assets.imagesBathtub,
      'spec': '2 Bathroom',
    },
    {
      'icon': Assets.imagesEUser,
      'spec': '2 Guest',
    },
    {
      'icon': Assets.imagesHome,
      'spec': 'Entire Place',
    },
    {
      'icon': Assets.imagesMaximize,
      'spec': '1500 SqFt',
    },
  ];
  final List<Map<String, dynamic>> amenities = [
    {
      'icon': Assets.imagesGym,
      'amenity': 'Gym',
    },
    {
      'icon': Assets.imagesTelevision,
      'amenity': 'TV Cable',
    },
    {
      'icon': Assets.imagesLaundry,
      'amenity': 'Laundry',
    },
    {
      'icon': Assets.imagesDishwasher,
      'amenity': 'Dishwasher',
    },
    {
      'icon': Assets.imagesMicrowave,
      'amenity': 'Microwave',
    },
    {
      'icon': Assets.imagesSauna,
      'amenity': 'Sauna',
    },
    {
      'icon': Assets.imagesSwimmer,
      'amenity': 'Swimming Pool',
    },
    // {
    //   'icon': Assets.imagesWifi,
    //   'amenity': 'Wi-Fi',
    // },
    {
      'icon': Assets.imagesBed,
      'amenity': 'Air conditioning',
    },
    {
      'icon': Assets.imagesSkewer,
      'amenity': 'Barbecue Area',
    },
  ];
  final List<Map<String, dynamic>> facilities = [
    {
      'icon': Assets.imagesMedicine,
      'facility': 'Pharmacy',
    },
    {
      'icon': Assets.imagesCeremony,
      'facility': 'Reception',
    },
    {
      'icon': Assets.imagesCarParking,
      'facility': 'Free Parking',
    },
    {
      'icon': Assets.imagesSunbed,
      'facility': 'Beachhead',
    },
    {
      'icon': Assets.imagesShoppingCart,
      'facility': 'Markets',
    },
    {
      'icon': Assets.imagesPlayground,
      'facility': 'Playground',
    },
    {
      'icon': Assets.imagesGuard,
      'facility': 'Security',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Preview Listing',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.search)),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.voiceIcon)),
          10.horizontalSpace
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          10.verticalSpace,
          SizedBox(
            height: 200,
            child: Swiper(
              itemCount: 4,
              scale: 0.90,
              viewportFraction: 0.90,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CommonImageView(
                  height: 200,
                  url: dummyImg4,
                  radius: 8.0,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Hotel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesMap,
                      height: 16,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Bubai, United Arab',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 4.0,
                      itemCount: 5,
                      itemSize: 16.0,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 1.0,
                      ),
                      unratedColor: Colors.amber.shade100,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.orangeColor,
                      ),
                    ),
                    Text(
                      '( 2k reviews )',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '\$300',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '/night',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: List.generate(
                    hotelSpecifications.length,
                    (index) {
                      var data = hotelSpecifications[index];
                      return iconTile(
                        icon: data['icon'],
                        title: data['spec'],
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                Text(
                  'About this listing',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                8.verticalSpace,
                Text(
                  'Are you looking for a reliable holiday rental company to take care of your property? Look no further than our company. We are experienced in managing listed property and have a proven track record of delivering good returns and profits for owners. We will take good care of your unit and make sure it is well maintained. We also have an extensive marketing network to ensure your property is rented out at a good price. So if you are looking for a hassle-free way to rent out your property, contact us today. We look forward to working with you.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                // MyText(
                //   text:
                //       'Are you looking for a reliable holiday rental company to take care of your property? Look no further than our company. We are experienced in managing listed property and have a proven track record of delivering good returns and profits for owners. We will take good care of your unit and make sure it is well maintained. We also have an extensive marketing network to ensure your property is rented out at a good price. So if you are looking for a hassle-free way to rent out your property, contact us today. We look forward to working with you.',
                //   color: kGreyColor3,
                //   size: 12,
                //   height: 1.7,
                //   paddingBottom: 20,
                // ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Photos',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 64.67,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return CommonImageView(
                      url: dummyImg4,
                    );
                  },
                ),
                10.verticalSpace,
                Text(
                  'Features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                5.verticalSpace,
                Text(
                  'Amenities',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                3.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    amenities.length,
                    (index) {
                      var data = amenities[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: iconTile(
                          icon: data['icon'],
                          title: data['amenity'],
                        ),
                      );
                    },
                  ),
                ),

                Text(
                  'Facilities',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    facilities.length,
                    (index) {
                      var data = facilities[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: iconTile(
                          icon: data['icon'],
                          title: data['facility'],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Map',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                CommonImageView(
                  height: 190,
                  imagePath: Assets.googleMap,
                  radius: 15.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    5.horizontalSpace,
                    Text(
                      '5.0 • 2k reviews',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return ReviewBox(
                  avatarUrl: dummyImg4,
                  name: 'Blair',
                  isVerified: true,
                  postedTime: '2 weeks ago',
                  rating: 4.0,
                  feedback: 'Amazing stay!',
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: GradientElevatedButton(
                      color: AppColors.blackColor,
                      label: 'View All Reviews',
                      onPressed: () {},
                      width: 170.w),
                ),
                const SizedBox(
                  height: 20,
                ),
                HostedBy(
                  avatarUrl: dummyImg4,
                  name: 'User Name',
                  isVerified: true,
                  rating: 3.0,
                  totalReviews: '2k',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae feugiat nunc. Integer congue fringilla odio non dapibus. Aliquam varius massa sapien, vitae elementum nibh tincidunt ut. Quisque vel eros augue. Nam purus orci, venenatis eget tincidunt non, maximus luctus ligula. Nullam id enim ante. Integer porttitor non ligula id laoreet.',
                  eContactName: 'Raju',
                  eEmail: 'abc@email.com',
                  ePhone: '+ 1 123 4567 8901',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
