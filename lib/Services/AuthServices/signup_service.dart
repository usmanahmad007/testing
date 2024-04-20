import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';

Future<UserModel> signUpService(
    {required String fullName,
    required String email,
    required String password}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.signUP),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName.trim(),
        'email': email.trim(),
        'password': password.trim(),
        "role": "user",
        "deviceToken": "mydevicetoken"
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw responseBody['message'].toString();
      }
      UserModel responseModel = UserModel.fromMap(responseBody);

      return responseModel;
    } else {
      throw 'Failed to sign up';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
