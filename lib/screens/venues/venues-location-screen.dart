// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/custom-list-view-widget.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/search-field.dart';

class VenuesLocationScreen extends StatefulWidget {
  const VenuesLocationScreen({super.key});

  @override
  State<VenuesLocationScreen> createState() => _VenuesLocationScreenState();
}

class _VenuesLocationScreenState extends State<VenuesLocationScreen> {
  final ScrollController _scrollController = ScrollController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final List<Marker> _marker = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14.4746,
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: GradientAppBar(
          title: 'Choose Location',
          leading: IconButton(
              onPressed: () {}, icon: SvgPicture.asset(Assets.arrowBack)),
          actions: [
            IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.search)),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.voiceIcon)),
            10.horizontalSpace
          ],
        ),
        body: Stack(children: [
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage(Assets.googleMap), fit: BoxFit.cover)),
          // ),
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
                  focusNode: focusNode,
                  filledColor: AppColors.white,
                  hintText: 'Loaction',
                  preffixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.search,
                        color: AppColors.blackColor,
                        height: 12.h,
                      )),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Transform.scale(
                      scale: 0.4,
                      child: SvgPicture.asset(
                        Assets.voiceIcon,
                        color: AppColors.blackColor,
                        height: 10.h,
                      ),
                    ),
                  ),
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
            bottom: 110.h,
            child: GradientElevatedButton(
                gradient: AppColors.gradientColor,
                label: 'Confirm',
                onPressed: () {},
                width: 290.w),
          ),
          Positioned(
            height: 40.h,
            width: 270.w,
            left: 40.h,
            bottom: 60.h,
            child: GradientElevatedButton(
                color: AppColors.blackColor,
                label: 'View All Options',
                onPressed: () {},
                width: 290.w),
          )
        ]));
  }
}
