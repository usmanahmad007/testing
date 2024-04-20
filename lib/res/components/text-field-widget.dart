// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

Widget CustomTextFieldWidget({
  required String hintText,
  String? labelText,
  String? label,
  String? errorText,
  var errorStyle,
  bool filled = false,
  Color? filledColor,
  InputBorder? errorBorder,
  var labelStyle,
  var preffixIcon,
  Widget? suffixIcon,
  var initialValue,
  int maxLines = 1,
  FocusNode? focusNode,
  bool autoFocus = false,
  bool obscureText = false,
  bool readOnly = false,
  bool inDense = false,
  var style,
  double radius = 8,
  TextEditingController? controller,
  String? Function(String?)? onValidator,
  String? Function(String)? onChanged,
  String? Function(String)? onFieldSubmitted,
  Function()? suffixTap,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label!,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
      10.verticalSpace,
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // ignore: prefer_const_constructors
        ),
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          autofocus: autoFocus,
          readOnly: readOnly,
          style: const TextStyle(
            fontFamily: "Montserrat-Regular",
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
            fontSize: 12,
          ),
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: onValidator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            isDense: inDense,
            fillColor: AppColors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 11.h),
            errorText: errorText,
            errorStyle: errorStyle,
            labelStyle: labelStyle,
            labelText: labelText,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffCDCDCD), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffCDCDCD), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffCDCDCD), width: 1),
            ),
            errorBorder: errorBorder,
            suffixIcon: suffixIcon,
            hintText: hintText,
            prefixIcon: preffixIcon,
            hintStyle: const TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: AppColors.neutralGray,
              fontSize: 12,
            ),
          ),
        ),
      ),
    ],
  );
}
