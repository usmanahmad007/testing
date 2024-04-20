// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget FollowersButton({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      constraints: const BoxConstraints(
          maxHeight: double.infinity, maxWidth: double.infinity),
      child: Column(
        children: [
          const Text(
            '961',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          2.verticalSpace,
          const Text(
            'Followers',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

Widget FollowingButton({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      constraints: const BoxConstraints(
          maxHeight: double.infinity, maxWidth: double.infinity),
      child: Column(
        children: [
          const Text(
            '142',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          2.verticalSpace,
          const Text(
            'Following',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
