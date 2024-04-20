import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    } else {
      return null;
    }
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static String? passValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$');

    if (value!.isEmpty) {
      return 'Please this field must be filled';
    } else if (value.length < 6) {
      return 'Please enter minimum 6 chars';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    } else if (!value.isPhoneNumber) {
      return 'Please enter a valid number';
    } else {
      return null;
    }
  }

  static String? numberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    } else if (!value.isNumericOnly && value.length < 2) {
      return 'Please enter a number';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? values) {
    if (values!.isEmpty) {
      return "Please this field must be filled";
    } else if (!GetUtils.isEmail(values.toString())) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  static String? subjectValidator(String? values) {
    if (values!.isEmpty) {
      return "This field must be filled";
    }
    return null;
  }

  static String? messageValidator(String? values) {
    if (values!.isEmpty) {
      return "Please enter a message";
    }
    return null;
  }
}
