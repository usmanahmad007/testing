import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/date-time-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  LinearGradient? activeColor = AppColors.gradientColor;
  LinearGradient? unSelected = const LinearGradient(colors: [
    Colors.white,
    Colors.white,
  ]);
  final List<String> morningTime = [
    '10:10 AM',
    '10:30 AM',
    '10:50 AM',
    '11:20 AM',
    '11:40 AM',
  ];

  final List<String> afternoonTime = [
    '01:10 PM',
    '02:30 PM',
    '03:00 AM',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Select - Date & Time',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DatePicker(),
              10.verticalSpace,
              buildMorningSlot(),
              10.verticalSpace,
              buildAfternoonSlot(),
              10.verticalSpace,
              buildEveningSlot(),
              10.verticalSpace,
              buildNightSlot(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMorningSlot() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
      // height: 100.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Morning Slots',
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff111129),
                fontWeight: FontWeight.w600),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: morningTime.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    dateTimeController.setColor(index);
                  },
                  child: Obx(
                    () => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient:
                                dateTimeController.selectedIndex.value == index
                                    ? activeColor
                                    : unSelected,
                            border: Border.all(color: AppColors.neutralGray),
                            borderRadius: BorderRadius.circular(1.0)),
                        child: Text(
                          morningTime[index],
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                dateTimeController.selectedIndex.value == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        )),
                  ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 3.0),
          ),
        ],
      ),
    );
  }

  Widget buildAfternoonSlot() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
      // height: 100.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Afternoon Slots',
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff111129),
                fontWeight: FontWeight.w600),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: afternoonTime.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    dateTimeController.setAfternoonColor(index);
                  },
                  child: Obx(
                    () => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient:
                                dateTimeController.afternoonIndex.value == index
                                    ? activeColor
                                    : unSelected,
                            border: Border.all(color: AppColors.neutralGray),
                            borderRadius: BorderRadius.circular(1.0)),
                        child: Text(
                          morningTime[index],
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                dateTimeController.afternoonIndex.value == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        )),
                  ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 3.0),
          ),
        ],
      ),
    );
  }

  Widget buildEveningSlot() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
      // height: 100.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evening Slots',
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff111129),
                fontWeight: FontWeight.w600),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: afternoonTime.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    dateTimeController.setEveningColor(index);
                  },
                  child: Obx(
                    () => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient:
                                dateTimeController.eveningIndex.value == index
                                    ? activeColor
                                    : unSelected,
                            border: Border.all(color: AppColors.neutralGray),
                            borderRadius: BorderRadius.circular(1.0)),
                        child: Text(
                          morningTime[index],
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                dateTimeController.eveningIndex.value == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        )),
                  ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 3.0),
          ),
        ],
      ),
    );
  }

  Widget buildNightSlot() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
      // height: 100.h,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Night Slots',
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff111129),
                fontWeight: FontWeight.w600),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: morningTime.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    dateTimeController.setNightColor(index);
                  },
                  child: Obx(
                    () => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient:
                                dateTimeController.nightIndex.value == index
                                    ? activeColor
                                    : unSelected,
                            border: Border.all(color: AppColors.neutralGray),
                            borderRadius: BorderRadius.circular(1.0)),
                        child: Text(
                          morningTime[index],
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: dateTimeController.nightIndex.value == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        )),
                  ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 3.0),
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int _selectedDay = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // height: 140.h,
          constraints: BoxConstraints(maxHeight: double.infinity),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Select Date',
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ),
              const Divider(
                color: AppColors.neutralGray,
                thickness: 1,
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  String day =
                      ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index];
                  int date = index + 2;

                  return GestureDetector(
                    onTap: () => setState(() {
                      _selectedDay = date;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        gradient: _selectedDay == date
                            ? AppColors.gradientColor
                            : const LinearGradient(colors: [
                                Colors.transparent,
                                Colors.transparent,
                              ]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(day,
                              style: TextStyle(
                                  color: _selectedDay == date
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: _selectedDay == date
                                      ? FontWeight.w600
                                      : FontWeight.w600)),
                          10.verticalSpace,
                          Text(date.toString(),
                              style: TextStyle(
                                  color: _selectedDay == date
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: _selectedDay == date
                                      ? FontWeight.w600
                                      : FontWeight.w600)),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
