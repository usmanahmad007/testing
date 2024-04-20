import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';

Future<UserModel> logInService(
    {required String email, required String password}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.logIn),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email.trim(),
        'password': password.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw responseBody['message'].toString();
      }
      UserModel responseModel = UserModel.fromMap(responseBody);
      log(responseModel.toString());
      return responseModel;
    } else {
      throw 'Failed to log in';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
