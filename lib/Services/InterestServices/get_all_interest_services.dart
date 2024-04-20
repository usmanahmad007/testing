import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<List<Interest>> getAllInterestService() async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.get(
      Uri.parse(APIEndpoints.getAllInterests),
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
      List<dynamic> interestListResponse = responseBody['data'];
      List<Interest> interestList = interestListResponse.map((interest) {
        return Interest.fromMap(interest);
      }).toList();

      log('interest list: $interestList');
      return interestList;
    } else {
      throw 'Failed to get interest';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
