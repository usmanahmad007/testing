import 'package:get/get.dart';
import 'package:nomo_app/screens/auth/email-verification-screen.dart';
import 'package:nomo_app/screens/auth/forgot-password-screen.dart';
import 'package:nomo_app/screens/auth/login-screen.dart';
import 'package:nomo_app/screens/auth/phone-verify-screen.dart';
import 'package:nomo_app/screens/auth/sign-up-screen.dart';
import 'package:nomo_app/screens/auth/update-pass-screen.dart';
import 'package:nomo_app/screens/custom-navBar-screen.dart';
import 'package:nomo_app/screens/intro-screen.dart';
import 'package:nomo_app/screens/preferences/preferece-choose-location-screen.dart';
import 'package:nomo_app/screens/preferences/preferences-screen.dart';
import 'package:nomo_app/screens/profiles/edit-profile-screen.dart';
import 'package:nomo_app/screens/splash-screen.dart';

class AppRoutes {
  //splash
  static String splash = "/splash";

  //intro
  static String intro = "/intro";

  ///Authentication Routes
  static String signup = "/signup";
  static String login = "/login";
  static String forget = "/forget";
  static String updatePassword = "/updatePassword";
  static String emailVerify = "/emailVerify";
  static String phoneVerify = "/phoneVerify";

  // profile screens
  static String editProfile = "/editProfile";
  // static String changePass = "/changePass";
  // static String terms = "/terms";
  // static String privacy = "/privacy";
  // static String contact = "/contact";
  // static String myCourseDetail = "/myCourseDetail";

  //customer routes

  // Customer Bottom bar
  static String customerBottomNav = "/customerBottomNav";
  // static String customerHome = "/customerHome";

  static String preferenceScreen = "/preferenceScreen";
  static String prefLocation = "/prefLocation";
  // static String myCourseDetail = "/myCourseDetail";
  // static String selectionScreen = "/selectionScreen";
  // static String courseList = "/courseList";
  // static String searchCourse = "/searchCourse";
  // static String testPolicy = "/testPolicy";
  // static String courseDetail = "/courseDetail";
  // static String notifications = "/notifications";
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: signup,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: intro,
      page: () => const IntroScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: forget,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: updatePassword,
      page: () => const UpdatePasswordScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: emailVerify,
      page: () => const EmailVerificationScreen(
        pageType: 'changePass',
      ),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: phoneVerify,
      page: () => const PhoneVerificationScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: customerBottomNav,
      page: () => const CustomBottomScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: preferenceScreen,
      page: () => const PreferencesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: prefLocation,
      page: () => const PreferenceLocationScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: editProfile,
      page: () => const EditProfileScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
