import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/controllers/shared-index-controller.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/splash-screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
  );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

String dummyImg =
    'https://www.afristay.com/media/thumbnails/pictures/places/7032/royalvillas_1-x_large.jpg.1366x768_q85_crop_upscale.jpg';
String dummyImg1 =
    'https://images.unsplash.com/photo-1531971589569-0d9370cbe1e5?q=80&w=2081&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
String dummyImg2 =
    'https://images.unsplash.com/photo-1561026554-29d9815d4f3d?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
String dummyImg3 =
    'https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
String dummyImg4 =
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/15285563.jpg?k=5dabb705c470e0daa5bd45db238fa88ef16906db948e180e2137e976f5786c9a&o=&hp=1';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SharedController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Listener(
            onPointerDown: (_) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child: GetMaterialApp(
              getPages: AppRoutes.routes,
              defaultTransition: Transition.fadeIn,
              initialRoute: AppRoutes.splash,
              debugShowCheckedModeBanner: false,
              title: 'NOMO App',
              theme: ThemeData(
                fontFamily: 'Montserrat',
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
              ),
              home: child,
            ),
          );
        },
        child: SplashScreen());
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
