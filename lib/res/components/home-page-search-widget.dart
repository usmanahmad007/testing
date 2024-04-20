// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

Widget searchWidget({
  required String hintText,
  String? labelText,
  String? label,
  var errorStyle,
  bool filled = false,
  Color? filledColor,
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
  VoidCallback? onTap,
  Function()? suffixTap,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
}) {
  return Container(
    height: 42,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),

      //  boxShadow: [
      //   BoxShadow(
      //       color: Colors.grey.withOpacity(0.2),
      //       spreadRadius: 0,
      //       offset: const Offset(0, 2),
      //       blurRadius: 5)
      // ]
      // ignore: prefer_const_constructors
    ),
    child: TextFormField(
      textAlign: TextAlign.center,
      onTap: onTap,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      autofocus: autoFocus,
      readOnly: readOnly,
      style: style,
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
        fillColor: filledColor,
        contentPadding: EdgeInsets.only(left: 10),
        errorStyle: errorStyle,
        labelStyle: labelStyle,
        labelText: labelText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none),
        suffixIcon: suffixIcon,
        hintText: hintText,
        prefixIcon: preffixIcon,
        hintStyle: const TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          fontSize: 12,
        ),
      ),
    ),
  );
}
