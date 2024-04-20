import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/booking-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/screens/booking/own-bookings.dart';
import 'package:nomo_app/screens/booking/receive-booking.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> with SingleTickerProviderStateMixin {
  final BookingController bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Booking Record',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetBuilder<BookingController>(
              init: BookingController(),
              builder: (controller) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  // height: 50,
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: controller.currentIndex.value == i
                                  ? AppColors.gradientColor
                                  : const LinearGradient(
                                      colors: [Colors.black, Colors.black]),
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
                              onPressed: () => controller.setCurrentIndex = i,
                              child: Text(
                                i == 0 ? 'Receive Bookings' : 'Own Bookings',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      // if (i == 0)
                      const SizedBox(width: 12),
                    ],
                  ),
                );
              },
            ),
            _tabBarViews()
          ],
        ),
      ),
    );
  }
}

Widget _tabBarViews() {
  return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (controller) {
        return [
          const Expanded(child: ReceiveBooking()),
          const Expanded(child: OwnBooking()),
        ][controller.currentIndex.value];
      });
}
