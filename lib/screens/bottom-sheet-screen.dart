import 'package:flutter/material.dart';
import 'package:nomo_app/res/components/search-sheet-widget.dart';

class BottomSheetScreeen extends StatefulWidget {
  const BottomSheetScreeen({super.key});

  @override
  State<BottomSheetScreeen> createState() => _BottomSheetScreeenState();
}

class _BottomSheetScreeenState extends State<BottomSheetScreeen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchPlaces(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
