import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<bool> updateOrCreateMyPrefrencesService(List<int?>? interestIDs) async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.post(Uri.parse(APIEndpoints.createUpdatePref),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${userModel?.token}"
        },
        body: jsonEncode({"interestIds": interestIDs}));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw responseBody['message'].toString();
      }

      return true;
    } else {
      throw 'Failed to update prefrences';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
