import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';

import '../../res/utils/utils.dart';

Future<UserModel> socialSignUpService(
    {required String id, required String fullName, String? email}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.socialLogin),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName.trim(),
        'email': email?.trim() ?? '',
        'idOrEmail': id.trim(),
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
      Utils.showSnackbar(Get.context!, responseBody['message'].toString());

      return responseModel;
    } else {
      throw 'Failed to LogIn/SignUp socially';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
