import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/booking-widgets/booking-message-card.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';
import 'package:nomo_app/res/components/messages/message-field.dart';

enum BookingState {
  confirmed,
  rejected,
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    BookingState _bookingState = BookingState.confirmed;
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Joe Doodle',
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
              children: [
                const ChatBubble(
                  text: "Nice to hear that 🙂",
                  isSentByMe: false,
                  time: "14:29",
                ),
                const ChatBubble(
                  text: "Hi, can I get your best offers?",
                  isSentByMe: true,
                  time: "14:25",
                ),
                const ChatBubble(
                  text:
                      "👋 Hi Waldo! Thank you for reaching us out, let me walk you through our offers. Mind if I reaching you out via email?",
                  isSentByMe: false,
                  time: "14:32",
                ),
                const ChatBubble(
                  text: "Nice to hear that 😊",
                  isSentByMe: true,
                  time: "14:36",
                ),
                const BookingMessageCard(
                  isSentByMe: true,
                ),
                if (_bookingState == BookingState.confirmed ||
                    _bookingState == BookingState.rejected)
                  BookingAlertMessage(
                    isSentByMe: false,
                    text: _bookingState == BookingState.confirmed
                        ? 'Booking Confirm'
                        : 'Booking Reject',
                    time: '14:36',
                    asset: _bookingState == BookingState.confirmed
                        ? Assets.confirm
                        : Assets.reject,
                  ),
                const CallEndedMessage(
                  message: 'Voice Call Ended at 4:51 pm',
                  asset: Assets.call,
                ),
                const CallEndedMessage(
                  message: 'Video Call Ended at 4:51 pm',
                  asset: Assets.videoCall,
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

class BookingAlertMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;
  final String asset;
  const BookingAlertMessage(
      {required this.text,
      required this.isSentByMe,
      required this.time,
      super.key,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8.r);

    Widget avatar = Stack(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage(Assets.follower3),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  isSentByMe
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            time,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            time,
                            style: TextStyle(
                              color: isSentByMe
                                  ? Colors.white70
                                  : AppColors.blackColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                ],
              ),
              Image.asset(
                asset,
                height: 30,
              )
            ],
          ),
        ),
        if (isSentByMe) const SizedBox(width: 8),
      ],
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
          backgroundImage: AssetImage(Assets.follower3),
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

class CallEndedMessage extends StatelessWidget {
  final String message;
  final String asset;

  const CallEndedMessage({
    super.key,
    required this.message,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(asset, color: AppColors.green),
            SizedBox(width: 12.w),
            Text(
              message,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
