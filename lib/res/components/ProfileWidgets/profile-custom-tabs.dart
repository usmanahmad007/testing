import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class CustomProfileTab extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  // final int index;
  final bool? isSelected;
  const CustomProfileTab(
      {super.key,
      this.onTap,
      this.title,
      // required this.index,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 10.verticalSpace,
            Expanded(
              flex: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                    color: isSelected! ? AppColors.blackColor : AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          isSelected! ? AppColors.white : AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            8.verticalSpace,
            Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                flex: 0,
                child: Container(
                  height: 6,
                  width: 90,
                  decoration: BoxDecoration(
                      color: isSelected! ? AppColors.green : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
