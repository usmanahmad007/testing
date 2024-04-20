import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CustomListViewWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> options;
  final Function(String) onSelected;

  CustomListViewWidget({
    Key? key,
    required this.scrollController,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 8.r, right: 30.r),
        child: Material(
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 200.h,
            width: 400.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return ListTile(
                    leading: SvgPicture.asset(
                      Assets.locationPin,
                      height: 20.h,
                    ),
                    title: Text(
                      option,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff1F2A37),
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      option,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Color(0xffADB3B8),
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
