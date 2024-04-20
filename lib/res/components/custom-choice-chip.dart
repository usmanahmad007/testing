import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  CustomChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(!isSelected),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff439422) : AppColors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color:
                isSelected ? const Color(0xff439422) : const Color(0xffCDCDCD),
            width: 2,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                textScaleFactor: 0.75,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: isSelected ? AppColors.white : AppColors.blackColor,
                ),
              ),
            ),
            if (isSelected)
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
