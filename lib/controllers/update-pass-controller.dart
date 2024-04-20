import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Services/AuthServices/update_password_service.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';
import 'package:nomo_app/res/components/congrats-widget.dart';
import 'package:nomo_app/res/utils/utils.dart';
import 'package:nomo_app/screens/auth/login-screen.dart';

class UpdatePassController extends GetxController {
  GlobalKey<FormState>? updatePassFormKey;
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool _isHide = true.obs;
  RxBool _isHideConfirmPass = true.obs;

  RxBool get isHide => _isHide;
  RxBool get isHideConfirmPass => _isHideConfirmPass;

  set setIsHide(bool val) {
    _isHide.value = val;
    update();
  }

  set setIsHideConfirmPass(bool val) {
    _isHideConfirmPass.value = val;
    update();
  }

  void updateUserPassword(
      {required bool isFromForgotPass, required String userId}) async {
    try {
      if (confirmPassController.text != passController.text) {
        throw "Passwords do not match";
      }
      UserModel? userModel = UserModel();
      if (!isFromForgotPass) {
        userModel = UserPreferences.getUserModel();
        if (userModel?.user == null) {
          Utils.showSnackbar(
              Get.context!, "Session expired. Sign in again to continue.");
          Get.to(() => const LoginScreen());
          return;
        }
      }
      var response = await updatePasswordService(
          password: confirmPassController.text.trim(),
          userID:
              isFromForgotPass ? userId : userModel?.user?.id.toString() ?? '');
      if (response) {
        if (isFromForgotPass) {
          Get.off(() => CongratsMessage(
                congratsMsg: 'Your Password has been Updated successfully',
                onContinue: () => Get.offAllNamed(AppRoutes.login),
                titleMsg: 'Password Update',
              ));
        } else {
          Get.offAllNamed(AppRoutes.customerBottomNav);
        }
      }
    } catch (e) {
      Utils.showSnackbar(Get.context!, e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    updatePassFormKey = GlobalKey<FormState>();
    confirmPassController = TextEditingController();
    passController = TextEditingController();
  }
}
