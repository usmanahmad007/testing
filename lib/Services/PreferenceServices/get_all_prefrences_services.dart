import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<List<Prefrences>> getMyPrefrencesService() async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.get(
      Uri.parse(APIEndpoints.getMyPrefrences),
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
      List<dynamic> prefrencesListResponse = responseBody['data'];
      List<Prefrences> prefrencesList =
          prefrencesListResponse.map((prefrences) {
        return Prefrences.fromMap(prefrences);
      }).toList();

      // log('prefrences list: $prefrencesList');
      return prefrencesList;
    } else {
      throw 'Failed to get prefrences';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
