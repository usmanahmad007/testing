import 'package:flutter/material.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/post-card-widget.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const PostCardWidget();
          }),
    );
  }
}
