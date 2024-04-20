import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<UserModel> updateProfileService(
    {required User userModel, required String token}) async {
  try {
    log(userModel.toJson());
    final response = await http.post(
      Uri.parse(APIEndpoints.updateUser),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: userModel.toJson(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw "Request Failed";
      }
      UserModel responseModel = UserModel.fromMap(responseBody);
      UserModel? userNewModel = UserPreferences.getUserModel();
      responseModel.message = '';
      userNewModel?.updateFrom(responseModel);
      await UserPreferences.saveUserModel(userNewModel ?? UserModel());
      await UserPreferences.saveUserEmail(userNewModel?.user?.email ?? '');
      return responseModel;
    } else {
      throw 'Failed to Update profile';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
