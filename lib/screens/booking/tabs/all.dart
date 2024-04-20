import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/components/booking-widgets/recieve-booking-card.dart';
import 'package:nomo_app/screens/booking/booking-detail.dart';
import 'package:nomo_app/screens/booking/booking-empty-state.dart';

class All extends StatefulWidget {
  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  bool isEmpty = true;

  void showHotels() {
    setState(() {
      isEmpty = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? BookingEmptyState(
            onStartBooking: showHotels,
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return RecieveBookingVenueCards(onTap: () {
                Get.to(() => BookingDetail());
              });
            },
          );
  }
}
