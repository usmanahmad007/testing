import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<UserModel> getMyProfileService() async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();
    final response = await http.get(
      Uri.parse(APIEndpoints.myProfile),
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
      userModel?.updateFrom(responseModel);
      await UserPreferences.saveUserModel(userModel ?? UserModel());
      await UserPreferences.saveUserEmail(userModel?.user?.email ?? '');

      // log((UserPreferences.getUserModel()).toString());
      return responseModel;
    } else {
      throw 'Failed to get profile';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
