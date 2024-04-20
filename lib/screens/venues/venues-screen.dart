import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/venuesWidgets/build-header.dart';
import 'package:nomo_app/res/components/venuesWidgets/venue-card.dart';

class VenuesScreen extends StatefulWidget {
  const VenuesScreen({super.key});

  @override
  State<VenuesScreen> createState() => _VenuesScreenState();
}

class _VenuesScreenState extends State<VenuesScreen> {
  final List<Map<String, String>> gridItems = [
    {
      'image': Assets.royalVila,
      'title': 'Royal Villa',
      'subtitle': 'Puncak, Bogor',
      'status': 'Busy'
    },
    {
      'image': Assets.forestry,
      'title': 'Forestry Hotel',
      'subtitle': 'Sembalun, Lombok',
      'status': 'Quite'
    },
    {
      'image': Assets.greenVila,
      'title': 'Ubud Green Villa',
      'subtitle': 'Ubud, Bali',
      'status': 'Chilled',
    },
    {
      'image': Assets.forestry,
      'title': 'Forestry Hotel',
      'subtitle': 'Sembalun, Lombok',
      'status': 'Quite',
    },
  ];

  final List<Color> borderSidecolor = [
    AppColors.orangeColor,
    AppColors.green,
    const Color(0xff6B6B6B),
    AppColors.green,
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    int crossAxisCount = screenSize.width > 1200
        ? 4
        : screenSize.width > 600
            ? 3
            : 2;

    double aspectRatio = 4 / 3.7;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VenueHeaderWidget(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridItems.length,
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: aspectRatio
                  // (screenSize.width / (crossAxisCount * 200)),
                  ),
              itemBuilder: (context, index) {
                return VenueCard(
                  title: gridItems[index]['title'],
                  subtitle: gridItems[index]['subtitle'],
                  asset: gridItems[index]['image'],
                  color: borderSidecolor[index],
                  status: gridItems[index]['status'],
                );
              },
            ),
            // 10.verticalSpace,
            const VenueHeaderWidget(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
