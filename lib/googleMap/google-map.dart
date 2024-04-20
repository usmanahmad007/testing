import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';

class GoogleMapService {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> _marker = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14.4746,
  );

  Future<BitmapDescriptor> getCustomMarkerIcon() async {
    final ByteData byteData = await rootBundle.load(Assets.locationMarker);
    final Uint8List bytes = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  void loadCustomMarker(BuildContext context) async {
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

    _marker.addAll(customMarkers);
  }

  Widget googleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      compassEnabled: false,
      myLocationEnabled: true,
      markers: Set<Marker>.of(_marker),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
