import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<UserModel> getUserProfileService({required int userID}) async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();
    final response = await http.get(
      Uri.parse("${APIEndpoints.getUserProfile}/$userID"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${userModel?.token}"
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw responseBody['message'].toString();
      }
      UserModel responseModel = UserModel.fromMap(responseBody);
      // log(responseModel.toString());
      return responseModel;
    } else {
      throw 'Failed to get user profile';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
