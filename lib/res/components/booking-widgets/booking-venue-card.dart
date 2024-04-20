import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class BookingVenueCards extends StatelessWidget {
  const BookingVenueCards({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.kGreyColor2.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  blurRadius: 4)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.grandHotel),
                          fit: BoxFit.cover)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 55.h,
                        height: 17.h,
                        color: AppColors.orangeColor,
                        child: Text(
                          'Canceled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontFamily: 'Montserrat',
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        height: 20.h,
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        color: AppColors.blackColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '04  :  10  :  37',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit ..',
                        // maxLines: 2,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFF2E2),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Center(
                                child: SvgPicture.asset(Assets.calender)),
                          ),
                          8.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date and Day',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Monday, Dec 21',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffF4F1FA),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Center(child: SvgPicture.asset(Assets.time)),
                          ),
                          8.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '18:00 - 23:00 PM',
                                maxLines: 2,
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
                        ],
                      ),
                    ],
                  ),
                  // DashedLineVerticalPainter(),
                  // 10.horizontalSpace,
                  const Expanded(
                    child: DashedLine(
                      height: 3,
                      color: AppColors.neutralGray,
                    ),
                  ),
                  // 10.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.h,
                          width: 100,
                          decoration: BoxDecoration(
                            // color: color,
                            gradient: AppColors.gradientColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'View Venue',
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                  // letterSpacing: 0.5,
                                  fontSize: 8.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Container(
                          height: 30.h,
                          width: 100,
                          decoration: BoxDecoration(
                            // color: color,
                            gradient: AppColors.gradientColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    Assets.msg,
                                    height: 15,
                                  ),
                                ),
                                5.horizontalSpace,
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Contact',
                                    textScaleFactor: 0.9,
                                    style: TextStyle(
                                        // letterSpacing: 0.5,
                                        fontSize: 8.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Container(
                          height: 30.h,
                          width: 100,
                          decoration: BoxDecoration(
                            // color: color,
                            gradient: AppColors.gradientColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'View Booking',
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                  // letterSpacing: 0.5,
                                  fontSize: 8.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  final double height;
  final double heightContainer;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const DashedLine(
      {this.height = 4, this.color = Colors.black, this.heightContainer = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          final dashWidth = 2.0;
          final dashHeight = height;
          final dashCount = (boxHeight / (2 * dashHeight)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
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
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
