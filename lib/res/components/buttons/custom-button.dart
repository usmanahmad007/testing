import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonButtonWidget {
  static button({
    onTap,
    text,
  }) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: Get.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.green,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
