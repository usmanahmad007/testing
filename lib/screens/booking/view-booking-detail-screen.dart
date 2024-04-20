import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/buttons/pending-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'dart:io';

import 'package:barcode/barcode.dart';

enum BookingState { initial, pending, confirmed, rejected }

class ViewBookingDetailScreen extends StatefulWidget {
  const ViewBookingDetailScreen({super.key});

  @override
  State<ViewBookingDetailScreen> createState() =>
      _ViewBookingDetailScreenState();
}

class _ViewBookingDetailScreenState extends State<ViewBookingDetailScreen> {
  BookingState _bookingState = BookingState.initial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Booking Details',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 220.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xff449329),
                  Color(0xffB2E958),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Booking ID - ',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: const Color(0xff50555C),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: '#3867382910',
                              style: TextStyle(
                                  // letterSpacing: 1,
                                  color: const Color(0xff50555C),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600))
                        ])),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.copy,
                            size: 20,
                            color: Color(0xff50555C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  buildBookingCard(),
                  30.verticalSpace,
                  if (_bookingState == BookingState.initial)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          GradientElevatedButton(
                              gradient: AppColors.gradientColor,
                              label: 'Accept',
                              onPressed: () {
                                setState(() {
                                  _bookingState = BookingState.pending;
                                });
                              },
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
                  if (_bookingState == BookingState.pending)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          CustomElevatedButton(
                              color: const Color(0xffFF9D33),
                              label: 'Status - Pending',
                              onPressed: () {},
                              assets: Assets.pending,
                              width: double.infinity),
                          if (_bookingState == BookingState.confirmed)
                            CustomElevatedButton(
                                color: AppColors.blackColor,
                                label: 'Booking Confirm',
                                onPressed: () {},
                                assets: Assets.checkMark,
                                width: double.infinity),
                          if (_bookingState == BookingState.rejected)
                            CustomElevatedButton(
                                color: AppColors.blackColor,
                                label: 'Booking Reject',
                                onPressed: () {},
                                assets: Assets.rejectIcon,
                                width: double.infinity),
                          20.verticalSpace,
                          CustomElevatedButton(
                              gradient: AppColors.gradientColor,
                              label: 'Contact Venue',
                              onPressed: () {},
                              assets: Assets.msg,
                              width: double.infinity),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBookingCard() {
    return Stack(
      children: [
        Transform.scale(
            scale: 1.12,
            child: Image.asset(
              Assets.rectangle,
              height: 410,
            )),
        Container(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30, vertical: 10),
          constraints: const BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          decoration: BoxDecoration(
            // boxShadow: const [
            //   BoxShadow(
            //       color: AppColors.neutralGray,
            //       offset: Offset(0, 3),
            //       spreadRadius: 0,
            //       blurRadius: 7),
            // ],
            // image: DecorationImage(
            //   image: AssetImage(Assets.rectangle),
            //   fit: BoxFit.fitHeight,
            // ),
            borderRadius: BorderRadius.circular(8.r),
            // color: AppColors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Assets.follower1),
                  ),
                  20.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Abu Khalid',
                          style: TextStyle(
                              color: const Color(0xff50555C),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500)),
                      Text('Booking',
                          style: TextStyle(
                              color: const Color(0xff50555C),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              10.verticalSpace,
              const MySeparator(
                height: 0.5,
                color: AppColors.black2A3,
              ),
              20.verticalSpace,
              Text('Lorem ipsum dolor sit amet consectetur adipiscing...',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600)),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCustomContainer(
                    asset: Assets.calender,
                    color: const Color(0xffFFF2E2),
                    title: 'Date and Day',
                    subtitle: 'Monday, Dec 21, 2023',
                  ),
                  buildCustomContainer(
                    asset: Assets.time,
                    color: const Color(0xffF4F1FA),
                    title: 'Time',
                    subtitle: '18:00 - 23:00 PM',
                  ),
                ],
              ),
              25.verticalSpace,
              const MySeparator(
                height: 0.5,
                color: AppColors.blackColor,
              ),
              10.verticalSpace,
              Image.asset(
                Assets.barcode,
                height: 80,
                width: 340,
              ),
              10.verticalSpace,
              Center(
                child: Text(
                  '3434 3434 434 3211',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Custom Container

  Widget buildCustomContainer({
    required String title,
    required String subtitle,
    required String asset,
    required Color color,
  }) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 7),
      constraints: const BoxConstraints(
          maxHeight: double.infinity, maxWidth: double.infinity),
      // width: 30.h,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                asset,
                height: 20,
              ),
              5.horizontalSpace,
              Text(
                title,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            subtitle,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // BarCode Function

  buildBarcode(
    Barcode bc,
    String data, {
    String? filename,
    double? width,
    double? height,
    double? fontHeight,
  }) {
    final svg = bc.toSvg(
      data,
      width: width ?? 200,
      height: height ?? 80,
      fontHeight: fontHeight,
    );

    // Save the image
    filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
    File('$filename.svg').writeAsStringSync(svg);
  }
}

// Custom Clipper Class
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double clipHeight = 20.0; // Height of the triangular clip
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    // Clip at the start side
    path.moveTo(0, size.height / 4);
    path.lineTo(0 + clipHeight, size.height / 4 - clipHeight);
    path.lineTo(0 + clipHeight, size.height / 4 + clipHeight);
    path.lineTo(0, size.height / 4);

    // Clip at the end side
    path.moveTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width - clipHeight, 3 * size.height / 4 - clipHeight);
    path.lineTo(size.width - clipHeight, 3 * size.height / 4 + clipHeight);
    path.lineTo(size.width, 3 * size.height / 4);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var smallLineLength = size.width / 20;
//     const smallLineHeight = 20;
//     var path = Path();
//     var triangleHeight = 20.0; // Height of the triangle cut on the sides

//     // Start with the triangular cut on the left
//     path.moveTo(0, triangleHeight);
//     path.lineTo(triangleHeight, 0);

//     // Line to the top right corner, accounting for the triangle cut on the right
//     path.lineTo(size.width - triangleHeight, 0);
//     path.lineTo(size.width, triangleHeight);

//     // Proceed with the original bottom zigzag pattern
//     path.lineTo(size.width, size.height - smallLineHeight);
//     for (int i = 19; i > 0; i--) {
//       if (i % 2 == 0) {
//         path.lineTo(smallLineLength * i, size.height - smallLineHeight);
//       } else {
//         path.lineTo(smallLineLength * i, size.height);
//       }
//     }

//     // Final line to the bottom left corner, closing the path
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper old) => false;
// }

// Dashed Line
class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 8.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
