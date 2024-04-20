import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/custom-list-view-widget.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/messages/chat-room-screen.dart';
import 'package:nomo_app/screens/messages/messages.dart';

class MyCurrentLocationScreen extends StatefulWidget {
  const MyCurrentLocationScreen({super.key});

  @override
  State<MyCurrentLocationScreen> createState() =>
      _MyCurrentLocationScreenState();
}

class _MyCurrentLocationScreenState extends State<MyCurrentLocationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<String> _locationSuggestions = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Spain',
    'Canada',
    'Poland',
    'Thailand',
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> _marker = [];
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
          onTap: () => showLocationDetails(context)),
      Marker(
          markerId: const MarkerId('2'),
          position: const LatLng(33.7297, 73.0746),
          infoWindow: const InfoWindow(title: 'F-6 Markaz'),
          icon: customIcon,
          onTap: () => showLocationDetails(context)),
      Marker(
          markerId: const MarkerId('3'),
          position: const LatLng(33.7087, 73.0397),
          infoWindow: const InfoWindow(title: 'F-8 Markaz'),
          icon: customIcon,
          onTap: () => showLocationDetails(context)),
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Add Location',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.editProfileIcon)),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.settings)),
            10.horizontalSpace
          ],
        ),
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            compassEnabled: false,
            myLocationEnabled: true,
            markers: Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 25.h,
            left: 15.w,
            right: 15.w,
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _locationSuggestions.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return SearchFieldWidget(
                  controller: textEditingController,
                  filledColor: AppColors.white,
                  focusNode: focusNode,
                  hintText: 'Search for Location ',
                  preffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.search,
                        color: AppColors.blackColor,
                        height: 12.h,
                      )),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.voiceIcon,
                        color: AppColors.blackColor,
                        height: 12.h,
                      )),
                );
              },
              optionsViewBuilder: (context, onSelected, options) {
                return CustomListViewWidget(
                  scrollController: _scrollController,
                  options: _locationSuggestions,
                  onSelected: (String option) {
                    // Handle option selection
                    print('Selected: $option');
                  },
                );
              },
              onSelected: (String selection) {
                print('You just selected $selection');
              },
            ),
          ),
          // Positioned(
          //   top: 85.h,
          //   left: 15.w,
          //   right: 15.w,
          //   child: Autocomplete<String>(
          //     optionsBuilder: (TextEditingValue textEditingValue) {
          //       if (textEditingValue.text == '') {
          //         return const Iterable<String>.empty();
          //       }
          //       return _locationSuggestions.where((String option) {
          //         return option.contains(textEditingValue.text.toLowerCase());
          //       });
          //     },
          //     fieldViewBuilder: (context, textEditingController, focusNode,
          //         onFieldSubmitted) {
          //       return SearchFieldWidget(
          //         filledColor: AppColors.white,
          //         controller: textEditingController,
          //         focusNode: focusNode,
          //         hintText: 'Type your Location / Address here',
          //         preffixIcon: IconButton(
          //             onPressed: () {},
          //             icon: SvgPicture.asset(
          //               Assets.locationPin,
          //               // color: AppColors.blackColor,
          //               height: 12.h,
          //             )),
          //       );
          //     },
          //     optionsViewBuilder: (context, onSelected, options) {
          //       return CustomListViewWidget(
          //         scrollController: _scrollController,
          //         options: _locationSuggestions,
          //         onSelected: (String option) {
          //           // Handle option selection
          //           print('Selected: $option');
          //         },
          //       );
          //     },
          //     onSelected: (String selection) {
          //       print('You just selected $selection');
          //     },
          //   ),
          // ),
          Positioned(
              // height: 209,
              width: 310.w,
              left: 20.h,
              bottom: 100,
              child: makeBookingCard())
        ]));
  }

  Widget makeBookingCard() {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.2),
                offset: const Offset(0, 3),
                spreadRadius: 2,
                blurRadius: 4),
            BoxShadow(
                color: AppColors.neutralGray.withOpacity(0.2),
                offset: const Offset(-3, 0),
                spreadRadius: 0,
                blurRadius: 3),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Grand Mercure Hotel and Residences Dubai Airport',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Montserrat"),
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Color(0xffFFC107),
                size: 20,
              ),
              3.horizontalSpace,
              const Text(
                '4.7',
                style: TextStyle(
                    color: Color(0xff6F6E6E),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              )
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    color: AppColors.green,
                    size: 16,
                  ),
                  3.horizontalSpace,
                  const Text(
                    '500 M from your current location',
                    style: TextStyle(
                        color: Color(0xff070C18),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat"),
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  Assets.editIcon,
                  height: 15,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: GradientElevatedButton(
                      gradient: AppColors.gradientColor,
                      label: 'Make Booking',
                      onPressed: () {
                        Get.to(() => const ChatScreen());
                      },
                      width: width),
                ),
              ),
              8.horizontalSpace,
              Expanded(
                flex: 0,
                child: InkWell(
                  onTap: () {
                    Get.to(() => MessagesScreen());
                  },
                  child: Container(
                    height: 34.h,
                    width: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.borderSideColor)),
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        Assets.inbox,
                        color: AppColors.blackColor,
                        height: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              Expanded(
                flex: 0,
                child: InkWell(
                  onTap: () {
                    // Get.to(() => VideoCallScreen());
                  },
                  child: Container(
                    height: 34.h,
                    width: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.borderSideColor)),
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
