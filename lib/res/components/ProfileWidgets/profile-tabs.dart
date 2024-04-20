import 'package:flutter/material.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class ProfileTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileTabBar({
    super.key,
    required this.labels,
  });

  final List<String> labels;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, 60),
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        // margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.kSeoulColor,
              ),
              child: TabBar(
                automaticIndicatorColorAdjustment: false,
                labelColor: AppColors.blackColor,
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.blackColor,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
                labelStyle: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                tabs: labels
                    .map(
                      (e) => Text(
                        e,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
