import 'package:flutter/material.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

// ignore: must_be_immutable
class ExploreField extends StatelessWidget {
  ExploreField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.marginBottom = 10.0,
    this.isReadOnly = false,
    required this.prefixIcon,
  }) : super(key: key);
  final String? hintText;
  var prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  double? marginBottom;
  bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: marginBottom!,
      ),
      decoration: BoxDecoration(
        color: AppColors.kSeoulColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        readOnly: isReadOnly!,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.neutralGray,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Image.asset(
          //       prefixIcon!,
          //       height: 20,
          //     ),
          //   ],
          // ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
