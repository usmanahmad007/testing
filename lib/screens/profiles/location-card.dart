import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/venues/venues-location-screen.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
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
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              margin: EdgeInsets.all(5.h),
              height: 100.h,
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
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
            child: Row(
              children: [
                Expanded(
                    flex: 0,
                    child: SvgPicture.asset(
                      Assets.locationPin,
                      height: 30.h,
                    )),
                10.horizontalSpace,
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Grand Mercure Hotel and Residences Dubai Airport',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                15.horizontalSpace,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: TextButton(
                onPressed: () {
                  Get.to(() => const VenuesLocationScreen());
                },
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    decoration: TextDecoration.underline,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
