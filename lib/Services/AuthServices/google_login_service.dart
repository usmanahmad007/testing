import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Services/AuthServices/social_login_service.dart';

Future<UserModel> googleSignInService() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: <String>['email', 'profile'],
    );

    var googleUser = await googleSignIn.signIn();
    log(googleUser.toString());
    UserModel? userModel = await socialSignUpService(
        fullName: googleUser?.displayName ?? "",
        id: googleUser?.id ?? "",
        email: googleUser?.email ?? "");

    return userModel;
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
