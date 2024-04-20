import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Privacy Policies',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt '
              'ut labore et dolore magna aliqua. Urna id volutpat lacus laoreet non curabitur'
              'gravida arcu. Amet nisl purus in mollis nunc sed id.'
              'Elementum curabitur vitae nunc sed. A pellentesque sit amet porttitor eget. Ac turpis egestas integer eget aliquet nibh. Nibh praesent tristique magna sit amet purus gravida. Sagittis nisl rhoncus mattis rhoncus urna neque viverra.'
              'Volutpat sed cras ornare arcu dui vivamus arcu felis bibendum.',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            15.verticalSpace,
            const Text(
              'Sagittis vitae et leo duis ut diam. Et pharetra pharetra massa massa. Faucibus et molestie ac feugiat. Ac feugiat sed lectus vestibulum. Sagittis eu volutpat odio facilisis. Venenatis urna cursus eget nunc scelerisque viverra mauris. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Etiam tempor orci eu lobortis elementum nibh. Quis auctor elit sed vulputate mi sit. Quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci. Suspendisse potenti nullam ac tortor vitae purus faucibus ornare suspendisse. Lorem sed risus ultricies tristique nulla aliquet enim tortor. Condimentum mattis pellentesque id nibh tortor id.',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
