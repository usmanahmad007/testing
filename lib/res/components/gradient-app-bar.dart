import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Color> gradientColors;
  final double elevation;
  final dynamic leading;
  final List<Widget>? actions;
  const GradientAppBar(
      {super.key,
      required this.title,
      this.gradientColors = const [Colors.green, Colors.blue],
      this.elevation = 4.0,
      this.leading,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppColors.gradientColor),
      ),
      actions: actions,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
