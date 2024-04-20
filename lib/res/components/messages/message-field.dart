import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/post-button.dart';

class MessageField extends StatefulWidget {
  const MessageField({super.key});

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/happy-pop.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: AppColors.neutralGray.withOpacity(0.5)))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type your message...",
                hintStyle: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff878F96),
                    fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                prefixIcon: GestureDetector(
                  onTap: () {
                    showAttachmentBottomSheet(context);
                  },
                  child: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      Assets.documentAdd,
                      height: 10.h,
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              ),
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          const SizedBox(width: 8),
          PostButton(
              width: 70.w,
              text: 'Send',
              onTap: () async {
                await playSound();
              })
        ],
      ),
    );
  }
}

void showAttachmentBottomSheet(BuildContext context) {
  List<String>? titleList = [
    'Document',
    'Camera',
    'Gallery',
    'Audio',
    'Location',
    'Contact',
  ];

  List<String>? assetsList = [
    Assets.documentText,
    Assets.camera,
    Assets.gallery,
    Assets.volume,
    Assets.location1,
    Assets.call,
  ];
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            // color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Attachment File',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: List.generate(6, (index) {
                  // Placeholder for icons and text
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularGradientButton(
                          gradient: AppColors.gradientColor,
                          onPressed: () {
                            print('Circular Gradient Button pressed!');
                          },
                          child: SvgPicture.asset(assetsList[index])),
                      const SizedBox(height: 8),
                      Text(
                        titleList[index],
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class CircularGradientButton extends StatelessWidget {
  final Gradient gradient;
  final Widget child;
  final double size;
  final VoidCallback onPressed;

  const CircularGradientButton({
    Key? key,
    required this.gradient,
    required this.child,
    this.size = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(18.r),
          gradient: gradient,
        ),
        child: Container(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
