import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class SelectEmojiScreen extends StatefulWidget {
  const SelectEmojiScreen({super.key});

  @override
  _SelectEmojiScreenState createState() => _SelectEmojiScreenState();
}

class _SelectEmojiScreenState extends State<SelectEmojiScreen> {
  String _selectedEmoji = '😀';
  Color _emojiBackgroundColor = Colors.grey[300]!;
  bool _isLoading = false;
  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      _selectedEmoji = emoji.emoji;

      _emojiBackgroundColor =
          Color((emoji.hashCode * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  void _simulateLoading() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: GradientAppBar(
        title: 'Emoji and Stickers',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _simulateLoading,
            icon: _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
          ),
          10.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CircleAvatar(
                backgroundColor: _emojiBackgroundColor,
                radius: 90,
                child: Text(
                  _selectedEmoji,
                  style: const TextStyle(fontSize: 100),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .4,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                _onEmojiSelected(emoji);
              },
              onBackspacePressed: () {},
              config: Config(
                height: Get.height * .4,
                // bgColor: const Color(0xFFF2F2F2),
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  emojiSizeMax: 28 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
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
        ],
      ),
    );
  }
}
