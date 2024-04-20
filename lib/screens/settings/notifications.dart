import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/notification-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        title: 'Notifications',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Push Notifications',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff121212))),
            ),
            Obx(() => SwitchListTile.adaptive(
                  activeTrackColor: AppColors.green,
                  contentPadding: EdgeInsets.zero,
                  inactiveTrackColor: const Color(0xff50555C),
                  inactiveThumbColor: AppColors.white,
                  title: const Text(
                    'Pause all',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Temporarily pause notifications',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768089)),
                  ),
                  value: notificationController.pauseAll.value,
                  onChanged: notificationController.toggleAllNotifications,
                )),
            const Divider(),
            Obx(() => Column(
                  children: notificationController.notifications.keys
                      .map((String key) {
                    return SwitchListTile.adaptive(
                      activeTrackColor: AppColors.green,
                      inactiveTrackColor: const Color(0xff50555C),
                      inactiveThumbColor: AppColors.white,
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      title: Text(
                        key,
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      value: !notificationController.pauseAll.value &&
                          notificationController.notifications[key]!.value,
                      onChanged: notificationController.pauseAll.value
                          ? null
                          : (bool newValue) {
                              notificationController
                                  .notifications[key]!(newValue);
                            },
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}
