import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomo_app/res/assets/assets.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Icon? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      // child: Theme(
      //   data: Theme.of(context).copyWith(
      //     splashColor: kSeoulColor2,
      //     highlightColor: kSeoulColor2,
      //   ),
      child: ListTile(
          onTap: onTap,
          minLeadingWidth: 30,
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                color: const Color(0xff0D120E),
                fontWeight: FontWeight.w600),
          ),
          trailing: SvgPicture.asset(
            Assets.down,
          )),
      // ),
    );
  }
}
