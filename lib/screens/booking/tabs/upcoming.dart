import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/components/booking-widgets/recieve-booking-card.dart';
import 'package:nomo_app/screens/booking/booking-detail.dart';

class Upcoming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return RecieveBookingVenueCards(onTap: () {
          Get.to(() => BookingDetail());
        });
      },
    );
  }
}
