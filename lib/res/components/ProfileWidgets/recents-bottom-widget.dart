import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class RecentsBottomWidget extends StatefulWidget {
  const RecentsBottomWidget({super.key});

  @override
  State<RecentsBottomWidget> createState() => _RecentsBottomWidgetState();
}

class _RecentsBottomWidgetState extends State<RecentsBottomWidget> {
  int _selectedFilter = 0;

  void _updateSelection(int? newFilter) {
    if (newFilter != null) {
      setState(() {
        _selectedFilter = newFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      height: screenHeight * .42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 5),
            child: Text('Filter Comments',
                style: TextStyle(
                    color: Color(0xff111129),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat')),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text('Most relevant',
                      style: TextStyle(
                          color: Color(0xff111129),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  subtitle: const Text(
                      'Show Friend’s comments and most engaging comments first',
                      style: TextStyle(
                          color: Color(0xff50555C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  trailing: Radio<int>(
                    activeColor: AppColors.blueColor,
                    value: 0,
                    groupValue: _selectedFilter,
                    onChanged: (int? value) {
                      _updateSelection(value);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Newest',
                      style: TextStyle(
                          color: Color(0xff111129),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  subtitle: const Text(
                      'Show all comments, with the newest comments first.',
                      style: TextStyle(
                          color: Color(0xff50555C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  trailing: Radio<int>(
                    value: 1,
                    groupValue: _selectedFilter,
                    activeColor: AppColors.blueColor,
                    onChanged: (int? value) {
                      _updateSelection(value);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('All comments',
                      style: TextStyle(
                          color: Color(0xff111129),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  subtitle: const Text(
                      'Show all comments, including potential spam. The most relevant comments will appear first.',
                      style: TextStyle(
                          color: Color(0xff50555C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat')),
                  trailing: Radio<int>(
                    value: 2,
                    groupValue: _selectedFilter,
                    activeColor: AppColors.blueColor,
                    onChanged: (int? value) {
                      _updateSelection(value);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
