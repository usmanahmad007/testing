import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class GalleryViewImageScreen extends StatefulWidget {
  const GalleryViewImageScreen({
    super.key,
  });

  @override
  State<GalleryViewImageScreen> createState() => _GalleryViewImageScreenState();
}

class _GalleryViewImageScreenState extends State<GalleryViewImageScreen> {
  int currentPage = 1;
  final int totalPages = 12;

  void _goToPreviousPage() {
    setState(() {
      if (currentPage > 1) {
        currentPage--;
      }
    });
  }

  void _goToNextPage() {
    setState(() {
      if (currentPage < totalPages) {
        currentPage++;
      }
    });
  }

  final List<String> imageAssets = [
    Assets.royalVila,
    Assets.resortImage,
    Assets.grandHotel,
    Assets.greenVila,
    Assets.royalVila,
    Assets.resortImage,
    Assets.grandHotel,
    Assets.greenVila,
    Assets.royalVila,
    Assets.resortImage,
    Assets.grandHotel,
    Assets.greenVila,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: GradientAppBar(
        title: 'Gallery',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.follower1),
          ),
          15.horizontalSpace
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * .45,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageAssets[currentPage - 1]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            60.verticalSpace,
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: _goToPreviousPage,
                  ),
                  Text(
                    '$currentPage to $totalPages',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: _goToNextPage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//   Widget changeProfileButton() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Container(
//         height: 28.h,
//         width: 165.w,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.transparent,
//             shadowColor: Colors.transparent,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           onPressed: () {
//             Get.to(() => const ChangeImageWithCamera(
//                   pageType: 'viewProfilePic',
//                 ));
//           },
//           child: const Text(
//             'Change Profile Image',
//             style: TextStyle(
//                 fontSize: 12,
//                 color: AppColors.blackColor,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'Montserrat'),
//           ),
//         ),
//       ),
//     );
//   }
}
