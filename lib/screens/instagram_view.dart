import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/Models/instagram_model.dart';
import 'package:nomo_app/Services/instagram_service_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({super.key});

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(InstagramConstant.instance.url));

  @override
  Widget build(BuildContext context) {
    controller.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) {
          if (url.contains(InstagramConstant.redirectUri)) {
            final InstagramModel instagram = InstagramModel();
            var authCode = instagram.getAuthorizationCodefromUrl(url);
            instagram.getTokenAndUserID(authCode: authCode).then((isDone) {
              if (isDone) {
                instagram.getUserInstagramProfile().then((instaProfile) async {
                  // log('$instagram INSTA DATA!');
                  Get.back(result: instagram);
                });
              }
            });
            // Get.back(result: instagram);
          }
        },
      ),
    );
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    controller;
    super.dispose();
  }
}
