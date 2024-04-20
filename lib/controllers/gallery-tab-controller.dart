import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  set setCurrentIndex(int val) {
    _currentIndex.value = val;
    update();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: "Laptops"),
    Tab(text: "Mobile"),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
