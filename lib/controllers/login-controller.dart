import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/AppRoutes/app-routes.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Services/AuthServices/google_login_service.dart';
import 'package:nomo_app/Services/AuthServices/instagram_login_service.dart';
import 'package:nomo_app/Services/AuthServices/login_service.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';
import 'package:nomo_app/res/utils/utils.dart';

class LoginController extends GetxController {
  GlobalKey<FormState>? signinFormKey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  UserModel _userResponseModel = UserModel();

  final RxBool _isLoading = false.obs;
  final RxBool _remember = false.obs;
  final RxBool _isHide = true.obs;

  RxBool get remember => _remember;
  RxBool get isLoading => _isLoading;

  set setRemember(bool val) {
    _remember.value = val;
    update();
  }

  RxBool get isHide => _isHide;

  set setIsHide(bool val) {
    _isHide.value = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    signinFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  Future<void> logInUser() async {
    if (signinFormKey!.currentState!.validate()) {
      try {
        _isLoading.value = true;
        update();
        _userResponseModel = await logInService(
            email: emailController.text, password: passController.text);
        UserPreferences.clearUserPreferences();
        await UserPreferences.saveUserModel(_userResponseModel);
        await UserPreferences.saveUserEmail(emailController.text.trim());
        await UserPreferences.saveHasLoggedIn(true);

        _isLoading.value = false;

        update();
        Get.offAllNamed(AppRoutes.customerBottomNav);
      } catch (e) {
        Utils.showSnackbar(Get.context!, e.toString());
      } finally {
        _isLoading.value = false;
        update();
      }
    }
  }

  logInWithGoogle() async {
    try {
      _isLoading.value = true;
      update();
      _userResponseModel = await googleSignInService();
      UserPreferences.clearUserPreferences();
      await UserPreferences.saveUserModel(_userResponseModel);
      await UserPreferences.saveUserEmail(
          _userResponseModel.user?.email?.trim() ?? "");
      await UserPreferences.saveHasLoggedIn(true);

      _isLoading.value = false;

      update();
      Get.offAllNamed(AppRoutes.customerBottomNav);
    } catch (e) {
      Utils.showSnackbar(Get.context!, e.toString());
    } finally {
      _isLoading.value = false;
      update();
    }
  }

  logInWithInstragram({required String id, required String fullName}) async {
    try {
      if (id.isEmpty) {
        throw "An error occured. Please try again";
      }
      _isLoading.value = true;
      update();
      _userResponseModel =
          await instagramSignInService(fullName: fullName, id: id);
      UserPreferences.clearUserPreferences();
      await UserPreferences.saveUserModel(_userResponseModel);
      await UserPreferences.saveUserEmail(
          _userResponseModel.user?.email?.trim() ?? "");
      await UserPreferences.saveHasLoggedIn(true);

      _isLoading.value = false;

      update();
      Get.offAllNamed(AppRoutes.customerBottomNav);
    } catch (e) {
      Utils.showSnackbar(Get.context!, e.toString());
    } finally {
      _isLoading.value = false;
      update();
    }
  }
}
