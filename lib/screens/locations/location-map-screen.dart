import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/custom-list-view-widget.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
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
                  hintText: 'Add your Current Location ',
                  preffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.locationPin,
                        // color: AppColors.blackColor,
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
          Positioned(
            top: 85.h,
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
                  filledColor: AppColors.white,
                  controller: textEditingController,
                  focusNode: focusNode,
                  hintText: 'Type your Location / Address here',
                  preffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.locationPin,
                        // color: AppColors.blackColor,
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
          Positioned(
            height: 40.h,
            width: 270.w,
            left: 40.h,
            bottom: 130,
            child: GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Confirm',
                onPressed: () {
                  Get.offAllNamed(AppRoutes.customerBottomNav);
                },
                width: 290.w),
          )
        ]));
  }
}
