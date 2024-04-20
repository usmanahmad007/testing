import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/messages-tab-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/search-field.dart';
import 'package:nomo_app/screens/messages/chat-room-screen.dart';
import 'package:nomo_app/screens/messages/health-and-support-screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool _isSearching = false;
  final MessagesTabController messagesTabController =
      Get.put(MessagesTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xffD9D9D9)),
        title: _isSearching
            ? SearchFieldWidget(
                hintText: 'Search',
                filledColor: AppColors.white,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.voiceIcon,
                      color: AppColors.blackColor,
                    )),
                preffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.search,
                      color: AppColors.blackColor,
                    )))
            : const Text(
                'Messages',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientColor),
        ),
        automaticallyImplyLeading: false,
        leading: _isSearching
            ? null
            : IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset(Assets.arrowBack)),
        actions: <Widget>[
          if (!_isSearching)
            IconButton(
              icon: SvgPicture.asset(Assets.search),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                });
              },
            ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            GetBuilder<MessagesTabController>(
              init: MessagesTabController(),
              builder: (controller) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
                  // height: 50,
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.setCurrentIndex = i,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 51,
                                  decoration: BoxDecoration(
                                    color: controller.currentIndex.value == i
                                        ? AppColors.blackColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    i == 0
                                        ? 'Friends & Venues'
                                        : 'Help & Support',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            controller.currentIndex.value == i
                                                ? Colors.white
                                                : AppColors.blackColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                5.verticalSpace,
                                Container(
                                    height: 4,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: controller.currentIndex.value == i
                                          ? AppColors.green
                                          : Colors.transparent,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.elliptical(40, 20),
                                          topRight: Radius.elliptical(40, 20)),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(width: 12),
                    ],
                  ),
                );
              },
            ),
            _tabBarViews()
          ],
        ),
      ),
    );
  }

  Widget _tabBarViews() {
    return GetBuilder<MessagesTabController>(
        init: MessagesTabController(),
        builder: (controller) {
          return [
            const Messages(),
            const HealthAndSupportMessages()
          ][controller.currentIndex.value];
        });
  }
}

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          bool isRead = index % 4 == 0;
          return MessageTile(
            isRead: isRead,
            title: 'Joe Doodle',
            message: '👋 Hi Waldo! Thank you for \nreaching us out...',
            date: 'May 2nd, 2022',
            onTap: () {
              Get.to(() => const ChatScreen());
            },
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final bool isRead;
  final VoidCallback onTap;

  const MessageTile({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    this.isRead = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        height: 106,
        decoration: BoxDecoration(
          color: !isRead ? Colors.white : const Color(0xffF8F9FA),
          border: Border.all(
              color: !isRead ? Colors.transparent : const Color(0xffDDE2E5)),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            !isRead
                ? BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(Assets.follower2),
                        ),
                        10.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                10.horizontalSpace,
                                !isRead
                                    ? Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffDEFFDD),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text('Unread',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      )
                                    : Container()
                              ],
                            ),
                            5.verticalSpace,
                            Text(message,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          date,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff878F96)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isRead)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
