import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hours Schedule',
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hours Schedule'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DailyProgress(day: 'Monday'),
            DailyProgress(day: 'Tuesday'),
            // ... Add widgets for other days
          ],
        ),
      ),
    );
  }
}

class DailyProgress extends StatelessWidget {
  final String day;
  const DailyProgress({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example data: each tuple represents (status, duration)
    final List<Tuple<Status, double>> hours = [
      Tuple(Status.open, 4.0),
      Tuple(Status.busy, 2.0),
      Tuple(Status.close, 2.0),
      // ... Add more tuples for each hour
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var hour in hours)
          HourIndicator(
            status: hour.item1,
            height: hour.item2 * 20, // 20 is the base height for 1 hour
          ),
        5.verticalSpace,
        Text(
          day,
          style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

enum Status { open, busy, close }

class HourIndicator extends StatelessWidget {
  final Status status;
  final double height;
  const HourIndicator({Key? key, required this.status, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case Status.open:
        color = AppColors.green;
        break;
      case Status.busy:
        color = AppColors.orangeColor;
        break;
      case Status.close:
        color = const Color(0xff767676).withOpacity(0.2);
        break;
    }

    return Container(
      width: 13.w,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10), // Rounded ends
      ),
    );
  }
}

class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;
  Tuple(this.item1, this.item2);
}

class TimeSlotList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        bool isSpecialSlot = index == 4;
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  '${index + 1} - ${index + 2}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            if (isSpecialSlot)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '61',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
          ],
        );
      },
    );
  }
}
