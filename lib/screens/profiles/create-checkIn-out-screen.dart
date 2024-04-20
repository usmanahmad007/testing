import 'dart:async';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/controllers/check-in-out-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/post-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:nomo_app/screens/locations/location-screen.dart';

class CreateCheckInAndOutScreen extends StatefulWidget {
  const CreateCheckInAndOutScreen({super.key});

  @override
  State<CreateCheckInAndOutScreen> createState() =>
      _CreateCheckInAndOutScreenState();
}

class _CreateCheckInAndOutScreenState extends State<CreateCheckInAndOutScreen> {
  final controller = TextEditingController();
  bool _emojiShowing = true;
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {}
    });
  }

  final CheckInOutTabController checkInOutTabController =
      Get.put(CheckInOutTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Profile',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.editProfileIcon)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.settings)),
          10.horizontalSpace
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<CheckInOutTabController>(
                    init: CheckInOutTabController(),
                    builder: (controller) {
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        // height: 50,
                        constraints:
                            const BoxConstraints(maxHeight: double.infinity),
                        margin: const EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 2; i++)
                              Expanded(
                                child: InkWell(
                                  onTap: () => controller.setCurrentIndex = i,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        alignment: Alignment.center,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.currentIndex.value == i
                                                  ? AppColors.blackColor
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          i == 0 ? 'Check In' : 'Check Out',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: controller
                                                          .currentIndex.value ==
                                                      i
                                                  ? Colors.white
                                                  : AppColors.blackColor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                      5.verticalSpace,
                                      Container(
                                          height: 3.5,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.currentIndex.value ==
                                                        i
                                                    ? AppColors.green
                                                    : Colors.transparent,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.elliptical(
                                                        40, 20),
                                                    topRight: Radius.elliptical(
                                                        40, 20)),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            // if (i == 0)
                            const SizedBox(width: 12),
                          ],
                        ),
                      );
                    },
                  ),
                  _tabBarViews()
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  // height: 93.h,
                  padding: const EdgeInsets.only(bottom: 0),

                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, -3),
                        ),
                      ],
                      border: Border(
                          top: BorderSide(
                        color: const Color(0xffC5C5C5).withOpacity(0.3),
                        width: 2,
                      ))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 10.h, 25.h, 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: getImageFromGallery,
                              icon: const Icon(
                                Icons.photo,
                                color: Color(0xff5C6363),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _emojiShowing = !_emojiShowing;
                                });
                              },
                              icon: const Icon(
                                Icons.emoji_emotions,
                                color: Color(0xff5C6363),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on,
                                color: AppColors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person_add,
                                color: Color(0xff5C6363),
                              ),
                            ),
                          ],
                        ),
                        PostButton(width: 90.w, text: 'Post', onTap: () {})
                      ],
                    ),
                  ),
                ),
                Offstage(
                  offstage: _emojiShowing,
                  child: SizedBox(
                    height: 270,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        controller.text = controller.text + emoji.emoji;
                      },
                      onBackspacePressed: () {},
                      config: Config(
                        height: 256,
                        // bgColor: const Color(0xFFF2F2F2),
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.20
                                  : 1.0),
                        ),
                        swapCategoryAndBottomBar: false,
                        skinToneConfig: const SkinToneConfig(),
                        categoryViewConfig: const CategoryViewConfig(),
                        bottomActionBarConfig: const BottomActionBarConfig(),
                        searchViewConfig: const SearchViewConfig(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 50.verticalSpace,
        ],
      ),
    );
  }

  Widget _tabBarViews() {
    return GetBuilder<CheckInOutTabController>(
        init: CheckInOutTabController(),
        builder: (controller) {
          return [
            const Expanded(child: CheckInOutScreens()),
            Expanded(child: Container()),
          ][controller.currentIndex.value];
        });
  }
}

class CheckInOutScreens extends StatefulWidget {
  const CheckInOutScreens({super.key});

  @override
  State<CheckInOutScreens> createState() => _CheckInOutScreensState();
}

class _CheckInOutScreensState extends State<CheckInOutScreens> {
  final controller = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final List<Marker> _marker = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14.4746,
  );

  @override
  initState() {
    super.initState();
    loadCustomMarker();
  }

  Future<BitmapDescriptor> getCustomMarkerIcon() async {
    final ByteData byteData = await rootBundle.load(Assets.locationMarker);
    final Uint8List bytes = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  void loadCustomMarker() async {
    final BitmapDescriptor customIcon = await getCustomMarkerIcon();
    final List<Marker> customMarkers = [
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(33.738045, 73.084488),
        infoWindow: const InfoWindow(title: 'My Position'),
        icon: customIcon,
        // onTap: () => showLocationDetails(context)
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(33.7297, 73.0746),
        infoWindow: const InfoWindow(title: 'F-6 Markaz'),
        icon: customIcon,
        // onTap: () => showLocationDetails(context)
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(33.7087, 73.0397),
        infoWindow: const InfoWindow(title: 'F-8 Markaz'),
        icon: customIcon,
        // onTap: () => showLocationDetails(context)
      ),
      Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(33.6973, 73.0515),
        infoWindow: const InfoWindow(title: 'G-8 Markaz'),
        icon: customIcon,
      ),
    ];
    setState(() {
      _marker.addAll(customMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 2,
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4.h,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: 'Write on your mind? ...... ',
                      hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xff232C2E),
                          fontFamily: 'inter'),
                      border: InputBorder.none,
                    ),
                  ),
                  // 20.verticalSpace,
                  Stack(
                    children: [
                      AspectRatio(
                          aspectRatio: 22 / 11,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 6,
                                    offset: const Offset(0, -3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12.r)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                margin: EdgeInsets.all(5.h),
                                height: 90.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    // image: const DecorationImage(
                                    //     image: AssetImage(Assets.googleMap), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: _kGooglePlex,
                                  compassEnabled: false,
                                  myLocationEnabled: true,
                                  markers: Set<Marker>.of(_marker),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => MyCurrentLocationScreen());
                          },
                          splashColor: Colors.grey.shade200,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.blackColor.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                )),
                            height: 50,
                            width: double.infinity,
                            child: const Text(
                              'Tap to Add your Location',
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
