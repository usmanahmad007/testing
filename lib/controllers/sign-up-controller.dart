import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Services/AuthServices/signup_service.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';
import 'package:nomo_app/res/utils/utils.dart';
import 'package:nomo_app/screens/auth/pick-username-screen.dart';

class SignupController extends GetxController {
  GlobalKey<FormState>? signupFormKey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final RxBool _remember = false.obs;
  final RxBool _isHide = true.obs;
  final RxBool _isConfirmHide = true.obs;
  final RxBool _isLoading = false.obs;
  UserModel _signUpUserResponseModel = UserModel();
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

  RxBool get isConfirmHide => _isConfirmHide;

  set setIsConfirmHide(bool val) {
    _isConfirmHide.value = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    signupFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupController extends GetxController {
//   GlobalKey<FormState>? signupFormKey;
//   TextEditingController? emailController;
//   TextEditingController? passController;
//   TextEditingController? nameController;
//   RxBool _remember = false.obs;
//   RxBool _isHide = true.obs;
//   RxBool _isConfirmHide = true.obs;

//   RxBool get remember => _remember;

//   set setRemember(bool val) {
//     _remember.value = val;
//     update();
//   }

//   RxBool get isHide => _isHide;

//   set setIsHide(bool val) {
//     _isHide.value = val;
//     update();
//   }

//   RxBool get isConfirmHide => _isConfirmHide;

//   set setIsConfirmHide(bool val) {
//     _isConfirmHide.value = val;
//     update();
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     signupFormKey = GlobalKey<FormState>();
//     emailController = TextEditingController();
//     passController = TextEditingController();
//     nameController = TextEditingController();
//   }
// }






