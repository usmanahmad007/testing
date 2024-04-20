import 'package:flutter/material.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class ExploreTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ExploreTabBar({
    super.key,
    required this.labels,
  });

  final List<String> labels;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, 80),
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        // margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              height: 62,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
                labelStyle: const TextStyle(
                  fontSize: 12,
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
