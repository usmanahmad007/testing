import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<bool> verifySignUpOTPService({required String otp}) async {
  try {
    String userEmail = UserPreferences.getUserEmail();
    if (userEmail.isEmpty) {
      throw 'Request failed';
    }
    final response = await http.post(
      Uri.parse(APIEndpoints.verifySignUpOTP),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"otp": otp.trim(), "email": userEmail}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Request failed';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
