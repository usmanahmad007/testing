import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';

Future<Map<String, dynamic>> verifyUserOTPService({required String otp}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.verifyUserOTP),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"otp": otp.trim()}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw 'Request failed';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
