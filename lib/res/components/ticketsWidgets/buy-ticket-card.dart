import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/ticket-button.dart';

class BuyTicketCard extends StatelessWidget {
  const BuyTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: ClipPath(
        clipper: DolDurmaClipper(right: 120, holeRadius: 40),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: AppColors.white,
            ),
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(
                left: 10.w, top: 10.h, bottom: 10.h, right: 7.w),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shamoli Parib...',
                        maxLines: 2,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.sp,
                            color: const Color(0xff402B6C),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFF2E2),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Center(
                                child: SvgPicture.asset(Assets.navigation)),
                          ),
                          8.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohakhali',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xff402B6C),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '20, Jun, 2020',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    color: const Color(0xff9D96AB),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffF4F1FA),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: const Center(
                              child: Icon(Icons.location_on_outlined,
                                  color: Color(0xff402B6C)),
                            ),
                          ),
                          8.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sylhet',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xff392D54),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '21, Jun, 2020',
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    color: const Color(0xff9D96AB),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // 10.horizontalSpace,
                CustomPaint(
                    size: const Size(1, double.infinity),
                    painter: DashedLineVerticalPainter()),
                26.horizontalSpace,
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '8:00 PM',
                                  maxLines: 2,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.sp,
                                      color: const Color(0xff392D54),
                                      fontWeight: FontWeight.w600),
                                ),
                                30.verticalSpace,
                                BuyTicketButton(
                                    width: 90.w,
                                    text: 'Buy Ticket',
                                    onTap: () {}),
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Price: ',
                                  maxLines: 2,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10.sp,
                                      color: const Color(0xff9D96AB),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  r"'$25",
                                  maxLines: 2,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.sp,
                                      color: const Color(0xffD42B18),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
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
