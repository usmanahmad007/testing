import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<List<MyVenues>> getMyVenuesService() async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.get(
      Uri.parse(APIEndpoints.getMyVenues),
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
      List<dynamic> venueDataList = responseBody['data'];
      List<MyVenues> venuesList = venueDataList.map((venueData) {
        return MyVenues.fromMap(venueData);
      }).toList();

      log('Venues list: $venuesList');
      return venuesList;
    } else {
      throw 'Failed to get my venues';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
