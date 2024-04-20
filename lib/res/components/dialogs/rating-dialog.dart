import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                    ),
                    // MyText(
                    //   text: 'Give feedback',
                    //   weight: FontWeight.w600,
                    // ),
                    Text(
                      'Give feedback',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          color: const Color(0xff0D120E),
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: RatingBar(
                    wrapAlignment: WrapAlignment.center,
                    initialRating: 3.0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    glow: false,
                    itemCount: 5,
                    unratedColor: AppColors.neutralGray,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemSize: 20.0,
                    onRatingUpdate: (rating) {},
                  ),
                ),
                8.verticalSpace,
                CustomTextFieldWidget(
                    maxLines: 5, hintText: 'Type Here', label: ''),
                15.verticalSpace,
                GradientElevatedButton(
                    gradient: AppColors.gradientColor,
                    label: 'Send',
                    onPressed: () {},
                    width: double.infinity),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
