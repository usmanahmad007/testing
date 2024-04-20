import 'dart:async';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/post-button.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:flutter/foundation.dart' as foundation;

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final controller = TextEditingController();
  bool _emojiShowing = true;
  File? _image;
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
          title: 'Create Post',
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(Assets.arrowBack))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
                    10.verticalSpace,
                    if (_image != null)
                      Container(
                        height: Get.height * .2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: FileImage(_image!), fit: BoxFit.cover)),
                        // child: Image.file(_image!, fit: BoxFit.cover),
                      )
                    else
                      Container()

                    // AspectRatio(
                    //     aspectRatio: 22 / 9,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           color: AppColors.white,
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: Colors.grey.withOpacity(0.1),
                    //               spreadRadius: 0,
                    //               blurRadius: 6,
                    //               offset: const Offset(0, -3),
                    //             ),
                    //           ],
                    //           borderRadius: BorderRadius.circular(12.r)),
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(12.r),
                    //         child: Container(
                    //           margin: EdgeInsets.all(5.h),
                    //           height: 80.h,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               // image: const DecorationImage(
                    //               //     image: AssetImage(Assets.googleMap), fit: BoxFit.cover),
                    //               borderRadius: BorderRadius.circular(12.r)),
                    //           child: GoogleMap(
                    //             mapType: MapType.normal,
                    //             initialCameraPosition: _kGooglePlex,
                    //             compassEnabled: false,
                    //             myLocationEnabled: true,
                    //             markers: Set<Marker>.of(_marker),
                    //             onMapCreated: (GoogleMapController controller) {
                    //               _controller.complete(controller);
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ))
                  ],
                ),
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
}
