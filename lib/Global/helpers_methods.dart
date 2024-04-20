import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

String formatISO8601ToHumanReadable(String iso8601DateString) {
  if (iso8601DateString.isEmpty) {
    return "";
  }

  DateTime dateTime = DateTime.parse(iso8601DateString);
  String formattedDateTime = DateFormat.yMMMMd().add_jm().format(dateTime);
  return formattedDateTime;
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          backgroundColor: AppColors.white,
          color: AppColors.green,
        ),
      ),
    );
  }
}
