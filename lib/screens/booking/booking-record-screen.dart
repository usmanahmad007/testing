import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/ticketsWidgets/ticket-card.dart';

class BookingRecordScreen extends StatefulWidget {
  const BookingRecordScreen({super.key});

  @override
  State<BookingRecordScreen> createState() => BookingRecordScreenState();
}

class BookingRecordScreenState extends State<BookingRecordScreen> {
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
      backgroundColor: const Color(0xffB5D89C),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TicketCard(),
              const TicketCard(),
              const TicketCard(),
              const TicketCard(),
              const TicketCard(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
