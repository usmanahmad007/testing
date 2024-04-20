import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';

class BookingEmptyState extends StatelessWidget {
  const BookingEmptyState({
    Key? key,
    required this.onStartBooking,
  }) : super(key: key);
  final VoidCallback onStartBooking;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 256,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.neutralGray,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  Assets.imagesWavingHand,
                  height: 50,
                ),
              ),
              Center(
                child: Text(
                  'No booking yet!',
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
              ),
              Center(
                child: Text(
                  'Time to dust off your bags and start\nplanning your next adventure',
                  maxLines: 2,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      height: 1.6,
                      fontSize: 12.sp,
                      color: const Color(0xff9D96AB),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: SizedBox(
                    width: Get.width * 0.55,
                    child: GradientElevatedButton(
                        gradient: AppColors.gradientColor,
                        label: 'Start Booking',
                        onPressed: onStartBooking,
                        width: double.infinity)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
