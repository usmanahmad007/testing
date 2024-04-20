// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';

Widget LikeButton({required VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      constraints: const BoxConstraints(
          maxWidth: double.infinity, maxHeight: double.infinity),
      // color: Colors.amber,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.likeIcon,
            height: 18.h,
          ),
          5.horizontalSpace,
          Text(
            'Like',
            style: TextStyle(
                fontFamily: 'inter',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}

Widget CommentButton({required VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      constraints: const BoxConstraints(
          maxWidth: double.infinity, maxHeight: double.infinity),
      // color: Colors.amber,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.commentIcon,
            height: 18.h,
          ),
          5.horizontalSpace,
          Text(
            'Comment',
            style: TextStyle(
                fontFamily: 'inter',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}

Widget PopUpButton() {
  return PopupMenuButton(
    itemBuilder: (context) {
      return [
        const PopupMenuItem(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        )
      ];
    },
    onSelected: (String value) {
      print('You Click on po up menu item');
    },
  );
}
