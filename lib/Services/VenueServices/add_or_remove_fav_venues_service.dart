import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<String> addOrRemoveFavouriteVenuesService(int venueID) async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.post(
      Uri.parse(APIEndpoints.addORRemoveFavVenue),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${userModel?.token}"
      },
      body: jsonEncode({"venueId": venueID}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw responseBody['message'].toString();
      }
      return responseBody['message'].toString();
    } else {
      throw 'Failed to add or remove fav venues';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
