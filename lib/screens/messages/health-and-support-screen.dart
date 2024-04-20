import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/messages/health-and-support-chat-screen.dart';

class HealthAndSupportMessages extends StatelessWidget {
  const HealthAndSupportMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap:
                  true, // Needed to make ListView.builder work inside Column
              physics:
                  NeverScrollableScrollPhysics(), // To prevent the ListView from scrolling independently
              itemCount: 4,
              itemBuilder: (context, index) {
                bool isRead = index % 4 == 0;
                return HealthAndSupportMessageTile(
                  isActive: isRead,
                  title: 'Ticket #174598325',
                  message: '👋 Hi Waldo! Thank you for \nreaching us out...',
                  date: 'May 2nd, 2022',
                  onTap: () {
                    Get.to(() => const HealthAndSupportChatScreen());
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: _createTicketButton(
                  label: 'Create New Ticket',
                  onPressed: () {},
                  width: double.infinity),
            )
          ],
        ),
      ),
    );
  }

  Widget _createTicketButton(
      {required final String label,
      var width = 100,
      required VoidCallback onPressed}) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: AppColors.gradientColor),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: AppColors.white),
            10.horizontalSpace,
            Text(
              label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthAndSupportMessageTile extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final bool isActive;
  final VoidCallback onTap;

  const HealthAndSupportMessageTile({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    this.isActive = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
        height: 106,
        decoration: BoxDecoration(
          color: !isActive ? Colors.white : const Color(0xffF8F9FA),
          border: Border.all(
              color: !isActive ? Colors.transparent : const Color(0xffDDE2E5)),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            !isActive
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
                          backgroundImage: AssetImage(Assets.appLogo),
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
                                !isActive
                                    ? Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffDEFFDD),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text('Active',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600)),
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.neutralGray
                                                .withOpacity(0.29),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Text('Closed',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600)),
                                      )
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
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
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
            if (!isActive)
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
