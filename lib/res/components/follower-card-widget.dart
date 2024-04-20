import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/follow-button-widget.dart';

class FollowerCardWidget extends StatelessWidget {
  final String? name;
  final String? images;
  const FollowerCardWidget({super.key, this.name, this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(-1, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.green,
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(Assets.follower3),
                ),
              ),
              14.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Darrell Steward',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff09101D)),
                  ),
                  5.verticalSpace,
                  const Text(
                    '@darrell _stew',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff50555C)),
                  ),
                  5.verticalSpace,
                  const Text(
                    '10 Mutual Friends',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff50555C)),
                  ),
                ],
              ),
            ],
          ),
          FollowButton(
            width: 80.w,
            text: 'Follow',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
