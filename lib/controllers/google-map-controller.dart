// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:nomo_app/res/assets/assets.dart';
// import 'package:nomo_app/res/components/dialogs/dialogs.dart';

// class GoogleMapControllerX extends GetxController {
//   final Rx<Completer> controller = Completer().obs;
//   // final RxList<Marker> markers = <Marker>[].obs;
//   static const CameraPosition kGooglePlex = CameraPosition(
//     target: LatLng(33.738045, 73.084488),
//     zoom: 14.4746,
//   );
//   var markers = <Marker>{}.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadCustomMarker();
//   }

//   Future<BitmapDescriptor> getCustomMarkerIcon() async {
//     final ByteData byteData = await rootBundle.load(Assets.locationMarker);
//     final Uint8List bytes = byteData.buffer.asUint8List();
//     return BitmapDescriptor.fromBytes(bytes);
//   }

//   void loadCustomMarker() async {
//     final BitmapDescriptor customIcon = await getCustomMarkerIcon();

//     final List<Marker> customMarkers = [
//       Marker(
//         markerId: const MarkerId('1'),
//         position: const LatLng(33.738045, 73.084488),
//         infoWindow: const InfoWindow(title: 'My Position'),
//         icon: customIcon,
//         // onTap: showLocationDetails(),
//       ),
//       // Add other markers similarly...
//     ];

//     markers.addAll(customMarkers);
//   }
// }
