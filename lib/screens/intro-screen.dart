import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/components/build-page-content.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/controllers/intro-screen-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/selection-screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final IntroScreenController introScreenController =
      Get.put(IntroScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 550.h,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  introScreenController.changePage(page);
                },
                children: [
                  PageContent(
                    title: 'Find Your Interests',
                    subtitle: "Find the places, venues, restaurants near you",
                    description:
                        "Discover your interests and explore the best local places, venues, and restaurants near you with our platform. From trendy hotspots to hidden gems, we've got you covered. Start your adventure today!",
                    image: Assets.friends,
                  ),
                  PageContent(
                    title: 'Plan Your Visit',
                    subtitle:
                        "See the place is busy or not ahead of time, get to",
                    description:
                        "Plan your perfect outing with ease on our platform. Check crowd levels, avoid long lines and secure your spot at your favorite places. Simplify your visits and maximize your enjoyment with just a few clicks.",
                    image: Assets.phaseImage,
                  ),
                  PageContent(
                    title: 'Experience Life',
                    subtitle: "",
                    description:
                        "Experience hassle-free ticket reservation with our platform. Say goodbye to long queues and secure your spot by reserve your token today. Enjoy a seamless and efficient ticket reservation process with us.",
                    image: Assets.experienceImage,
                  ),
                ],
              ),
            ),
            Obx(() =>
                _buildPageIndicator(introScreenController.currentPage.value)),
            20.verticalSpace,
            Obx(
              () => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: GradientElevatedButton(
                    gradient: AppColors.gradientColor,
                    width: 180.w,
                    label: introScreenController.currentPage.value < 2
                        ? 'Next'
                        : "Let's Start",
                    onPressed: () {
                      if (introScreenController.currentPage.value < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Go to next screen or perform any action
                        Get.to(
                          () => const SelectionScreen(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 400),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int currentPage) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.h,
      width: isActive ? 29.0 : 11.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.green : AppColors.blackColor,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
    );
  }
}
