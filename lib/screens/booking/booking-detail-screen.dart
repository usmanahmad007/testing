import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;
    double avatarRadius = screenWidth * 0.082;

    return Scaffold(
      appBar: GradientAppBar(
        title: 'Booking Detail',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Card(
                color: AppColors.white,
                elevation: 0,
                margin: EdgeInsets.all(padding),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.neutralGray.withOpacity(0.2),
                            offset: Offset(0, 3),
                            blurRadius: 3,
                            spreadRadius: 3)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: avatarRadius,
                              backgroundImage: NetworkImage(dummyImg1),
                            ),
                            10.horizontalSpace,
                            const Text('User Name',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            5.horizontalSpace,
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 23,
                              constraints: const BoxConstraints(
                                  maxWidth: double.infinity),
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text('Verified',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const InfoRow(
                            title: 'Check in',
                            value: '10 Oct 2022',
                            title1: 'Check out',
                            value1: '10 Oct 2022'),
                        const InfoRow(
                            title: 'Nights',
                            value: '1',
                            title1: 'Rooms',
                            value1: '1'),
                        const InfoRow(
                            title: 'Adults',
                            value: '2',
                            title1: 'Children',
                            value1: '3'),
                        const InfoRow(
                            title: 'Room Type',
                            value: 'Shared',
                            title1: 'Total Price',
                            value1: '\$300.00'),
                        const InfoColumn(
                            title: 'Confirmation Code', value: 'HMQBDKAQZ'),
                        const InfoColumn(
                            title: 'Phone Number', value: '+1 123 4567 8901'),
                        const InfoColumn(
                            title: 'Email Address', value: 'email@gmail.com'),
                        const InfoColumn(
                            title: 'Location', value: 'User Location'),
                        SizedBox(height: padding),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            children: [
                              GradientElevatedButton(
                                  gradient: AppColors.gradientColor,
                                  label: 'Accept',
                                  onPressed: () {},
                                  width: double.infinity),
                              20.verticalSpace,
                              GradientElevatedButton(
                                  color: AppColors.blackColor,
                                  label: 'Reject',
                                  onPressed: () {},
                                  width: double.infinity),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final String title1;
  final String value1;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
    required this.title1,
    required this.value1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(value,
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title1,
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(value1,
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String title;
  final String value;

  const InfoColumn({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
          4.verticalSpace,
          Text(value,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
