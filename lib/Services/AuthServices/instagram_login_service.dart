import 'dart:developer';

import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Services/AuthServices/social_login_service.dart';

Future<UserModel> instagramSignInService({required String id, required String fullName}) async {
  try {
    UserModel? userModel = await socialSignUpService(fullName: fullName.trim(), id: id.trim());

    return userModel;
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
