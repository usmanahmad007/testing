import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/messages/message-field.dart';

enum BookingState {
  confirmed,
  rejected,
}

class HealthAndSupportChatScreen extends StatefulWidget {
  const HealthAndSupportChatScreen({super.key});

  @override
  State<HealthAndSupportChatScreen> createState() =>
      _HealthAndSupportChatScreenState();
}

class _HealthAndSupportChatScreenState
    extends State<HealthAndSupportChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
        title: Row(
          children: [
            const Text(
              'Ticket #174598325',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600),
            ),
            10.horizontalSpace,
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 20,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color(0xffDEFFDD),
                  borderRadius: BorderRadius.circular(4)),
              child: const Text('Active',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientColor),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: const [
                ChatBubble(
                  text: "Nice to hear that 🙂",
                  isSentByMe: false,
                  time: "14:29",
                ),
                ChatBubble(
                  text: "That would be great!",
                  isSentByMe: true,
                  time: "14:25",
                ),
                ChatBubble(
                  text:
                      "👋 Hi Waldo! Thank you for reaching us out, let me walk you through our offers. Mind if I reaching you out via email?",
                  isSentByMe: false,
                  time: "14:32",
                ),
                ChatBubble(
                  text: "Nice to hear that 😊",
                  isSentByMe: true,
                  time: "14:36",
                ),
              ],
            ),
          ),
          const SafeArea(child: MessageField()),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.isSentByMe,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8.r);

    Widget avatar = Stack(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage(Assets.appLogo),
          radius: 20,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );

    return Row(
      mainAxisAlignment:
          isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSentByMe) ...[avatar, const SizedBox(width: 8)],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
              gradient: isSentByMe
                  ? AppColors.myMsgTextColor
                  : AppColors.deafaultTextColor,
              border: Border.all(
                  color: isSentByMe
                      ? Colors.transparent
                      : AppColors.neutralGray.withOpacity(0.5)),
              borderRadius: borderRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Align(
                alignment:
                    isSentByMe ? Alignment.bottomRight : Alignment.bottomLeft,
                child: Text(
                  time,
                  style: TextStyle(
                      color: isSentByMe
                          ? AppColors.blackColor
                          : AppColors.neutralGray,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              )
              // : Align(
              //     alignment: Alignment.bottomLeft,
              //     child: Text(
              //       time,
              //       style: TextStyle(
              //           color: isSentByMe
              //               ? AppColors.neutralGray
              //               : AppColors.blackColor,
              //           fontSize: 12,
              //           fontWeight: FontWeight.w600),
              //     ),
              //   ),
            ],
          ),
        ),
        if (isSentByMe) const SizedBox(width: 8),
      ],
    );
  }
}
