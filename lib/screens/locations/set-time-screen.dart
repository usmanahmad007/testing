import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class SetTimeScreen extends StatefulWidget {
  const SetTimeScreen({super.key});

  @override
  State<SetTimeScreen> createState() => _SetTimeScreenState();
}

class _SetTimeScreenState extends State<SetTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Set Time',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: ListView(
        children: const <Widget>[
          DayTiles(
            day: 'Monday',
          ),
          DayTiles(
            day: 'Tuesday',
          ),
          DayTiles(
            day: 'Wednesday',
          ),
          DayTiles(
            day: 'Thursday',
          ),
          DayTiles(
            day: 'Friday',
          ),
          DayTiles(
            day: 'Saturday',
          ),
          DayTiles(
            day: 'Sunday',
          ),
        ],
      ),
    );
  }
}

class DayTiles extends StatefulWidget {
  final String? day;
  const DayTiles({super.key, this.day});

  @override
  State<DayTiles> createState() => _DayTilesState();
}

class _DayTilesState extends State<DayTiles> {
  bool isExpanded = false;
  bool switchValue = true;

  // void _showTimePicker(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         height: MediaQuery.of(context).copyWith().size.height / 2,
  //         color: Colors.white, // This is not the background color
  //         child: Center(
  //           child: CupertinoTheme(
  //             data: CupertinoThemeData(
  //               brightness: Brightness
  //                   .dark, // Ensures text and other elements are light-colored, given the dark background.
  //               textTheme: CupertinoTextThemeData(

  //                 dateTimePickerTextStyle: TextStyle(
  //                   color: Colors.black, // Text color for the items
  //                 ),
  //               ),
  //             ),
  //             child: CupertinoTimerPicker(
  //               mode: CupertinoTimerPickerMode.hm,
  //               onTimerDurationChanged: (Duration changedtimer) {
  //                 // Handle the time change
  //               },
  //               // backgroundColor:
  //               //     Colors.black, // Background color for the picker
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void _showCustomTimePicker(BuildContext context, String day) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height * 0.55,
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           ),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 day,
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               const Divider(),
  //               Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Container(
  //                       height: 50.h,
  //                       width: double.infinity,
  //                       decoration: BoxDecoration(
  //                           // color: AppColors.blackColor,
  //                           borderRadius: BorderRadius.circular(6.r)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Text(
  //                             '03',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             '59',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             'PM',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.w600),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     20.verticalSpace,
  //                     Container(
  //                       height: 50.h,
  //                       width: double.infinity,
  //                       decoration: BoxDecoration(
  //                           color: AppColors.blackColor,
  //                           borderRadius: BorderRadius.circular(6.r)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Text(
  //                             '03 :',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             '59',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             'PM',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.w600),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     20.verticalSpace,
  //                     Container(
  //                       height: 50.h,
  //                       width: double.infinity,
  //                       decoration: BoxDecoration(
  //                           // color: AppColors.blackColor,
  //                           borderRadius: BorderRadius.circular(6.r)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Text(
  //                             '03',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             '59',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           32.horizontalSpace,
  //                           Text(
  //                             'AM',
  //                             style: TextStyle(
  //                                 fontSize: 25.sp,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.w600),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),

  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.center,
  //                 //   children: [
  //                 //     _buildPickerItem(context, 1, 12),
  //                 //     _buildPickerItem(context, 0, 59),
  //                 //     _buildPickerItem(context, 0, 1, isPeriod: true),
  //                 //   ],
  //                 // ),
  //               ),
  //               Center(
  //                 child: SafeArea(
  //                   child: GradientElevatedButton(
  //                       gradient: AppColors.gradientColor,
  //                       label: 'Done',
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                       width: 250.w),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void _showCustomTimePicker(BuildContext context, String day) {
    int selectedHour = 12; // Default selected hour
    int selectedMinute = 0; // Default selected minute
    List<String> periods = ['AM', 'PM'];
    int selectedPeriodIndex = 0; // Default to AM

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hours Picker
                      Expanded(
                        child: CupertinoPicker(
                          backgroundColor: Colors.transparent,
                          itemExtent: 50.h, // Height of each item

                          scrollController: FixedExtentScrollController(
                              initialItem: selectedHour - 1),
                          children: List<Widget>.generate(12, (int index) {
                            return Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }),
                          onSelectedItemChanged: (int value) {
                            selectedHour = value + 1;
                          },
                        ),
                      ),
                      // Minutes Picker
                      Expanded(
                        child: CupertinoPicker(
                          backgroundColor: Colors.transparent,
                          itemExtent: 50.h,
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedMinute),
                          children: List<Widget>.generate(60, (int index) {
                            return Center(
                              child: Text(
                                index.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }),
                          onSelectedItemChanged: (int value) {
                            selectedMinute = value;
                          },
                        ),
                      ),
                      // AM/PM Picker
                      Expanded(
                        child: CupertinoPicker(
                          backgroundColor: Colors.transparent,
                          itemExtent: 50.h,
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedPeriodIndex),
                          children: List<Widget>.generate(periods.length,
                              (int index) {
                            return Center(
                              child: Text(
                                periods[index],
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }),
                          onSelectedItemChanged: (int value) {
                            selectedPeriodIndex = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SafeArea(
                    child: GradientElevatedButton(
                        gradient: AppColors
                            .gradientColor, // Replace with your AppColors.gradientColor,
                        label: 'Done',
                        onPressed: () {
                          // Handle the selection (e.g., update the state with the selected time)
                          Navigator.pop(context);
                        },
                        width: 250.w),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void _showCustomTimePicker(BuildContext context, String day) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height * 0.55,
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           ),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 day,
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               const Divider(),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     // Hours ListView
  //                     Expanded(
  //                       child: ListView.builder(
  //                         itemCount: 24, // 24 hours format
  //                         itemBuilder: (context, index) {
  //                           return ListTile(
  //                             title: Text(
  //                               "${index.toString().padLeft(2, '0')}",
  //                               style: TextStyle(fontSize: 18.sp),
  //                             ),
  //                             onTap: () {
  //                               // Handle hour selection
  //                             },
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                     // Minutes ListView
  //                     Expanded(
  //                       child: ListView.builder(
  //                         itemCount: 60, // 60 minutes
  //                         itemBuilder: (context, index) {
  //                           return ListTile(
  //                             title: Text(
  //                               "${index.toString().padLeft(2, '0')}",
  //                               style: TextStyle(fontSize: 18.sp),
  //                             ),
  //                             onTap: () {
  //                               // Handle minute selection
  //                             },
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Center(
  //                 child: SafeArea(
  //                   child: ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.blue, // Background color
  //                     ),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: Text('Done', style: TextStyle(fontSize: 20.sp)),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildPickerItem(BuildContext context, int start, int end,
      {bool isPeriod = false}) {
    const double itemHeight = 100;
    const double pickerHeight = itemHeight * 2;

    List<Widget> items = List.generate(end - start + 1, (index) {
      String text = isPeriod
          ? (index == 0 ? 'AM' : 'PM')
          : (start + index).toString().padLeft(2, '0');
      return Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      );
    });

    return Container(
      width: isPeriod ? 80 : 60,
      height: pickerHeight,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CupertinoPicker(
        scrollController:
            FixedExtentScrollController(initialItem: isPeriod ? 1 : 30),
        backgroundColor: Colors.transparent,
        itemExtent: itemHeight,
        onSelectedItemChanged: (int value) {},
        squeeze: 1.4,
        useMagnifier: true,
        magnification: 1.1,
        looping: true,
        selectionOverlay: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white),
            ),
          ),
        ),
        children: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          children: [
            ListTile(
              leading: RotationTransition(
                turns: AlwaysStoppedAnimation(isExpanded ? 0.5 : 0.0),
                child: const Icon(Icons.keyboard_arrow_down),
              ),
              title: Text(
                widget.day!,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              trailing: Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  activeColor: AppColors.green),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
            AnimatedCrossFade(
              firstChild: Container(), // Empty container to 'hide' the content
              secondChild: Column(
                children: <Widget>[
                  const TimeSlot(time: '03:10 PM', period: 'Afternoon'),
                  const TimeSlot(
                      time: '05:00 PM', period: 'Afternoon', isEnabled: false),
                  const TimeSlot(time: '06:30 PM', period: 'Evening'),
                  const TimeSlot(time: '08:00 PM', period: 'Night'),
                  const TimeSlot(time: '10:00 PM', period: 'Night'),
                  InkWell(
                    onTap: () => _showCustomTimePicker(context, 'Monday'),
                    child: Container(
                        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        height: 35.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.add,
                                height: 20,
                              ),
                              8.horizontalSpace,
                              Text(
                                'Add New',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff7E7C7C)),
                              )
                            ])),
                  ),
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlot extends StatefulWidget {
  final String time;
  final String period;
  final bool isEnabled;

  const TimeSlot({
    Key? key,
    required this.time,
    required this.period,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    isEnabled = widget.isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      child: Dismissible(
        key: Key(widget.time),
        background: Container(
          // margin: const EdgeInsets.only(right: 20.0),
          alignment: AlignmentDirectional.centerEnd,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {},
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ListTile(
              title: Text(
                widget.time,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                widget.period,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              trailing: Switch(
                  value: isEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isEnabled = value;
                    });
                  },
                  inactiveTrackColor: Colors.white,
                  activeColor: AppColors.green),
              leading: SvgPicture.asset(
                isEnabled ? Assets.clockOn : Assets.clockOff,
                height: 30.h,
              )
              // color: isEnabled ? Colors.green : Colors.grey,

              ),
        ),
      ),
    );
  }
}








 //  Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text(
                      //           '03',
                      //           style: TextStyle(
                      //               fontSize: 25.sp,
                      //               color: Colors.grey,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         32.horizontalSpace,
                      //         Text(
                      //           '59',
                      //           style: TextStyle(
                      //               fontSize: 25.sp,
                      //               color: Colors.grey,
                      //               fontWeight: FontWeight.w600),
                      //         )
                      //       ],
                      //     ),
                      //     20.verticalSpace,
                      //     Container(
                      //       height: 50.h,
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(color: AppColors.blackColor),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           Text(
                      //             '03 :',
                      //             style: TextStyle(
                      //                 fontSize: 25.sp,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           32.horizontalSpace,
                      //           Text(
                      //             '59',
                      //             style: TextStyle(
                      //                 fontSize: 25.sp,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           32.horizontalSpace,
                      //           Text(
                      //             'PM',
                      //             style: TextStyle(
                      //                 fontSize: 25.sp,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     20.verticalSpace,
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text(
                      //           '03',
                      //           style: TextStyle(
                      //               fontSize: 25.sp,
                      //               color: Colors.grey,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         32.horizontalSpace,
                      //         Text(
                      //           '59',
                      //           style: TextStyle(
                      //               fontSize: 25.sp,
                      //               color: Colors.grey,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         32.horizontalSpace,
                      //         Text(
                      //           'AM',
                      //           style: TextStyle(
                      //               fontSize: 25.sp,
                      //               color: Colors.grey,
                      //               fontWeight: FontWeight.w600),
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),