import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';
import 'package:nomo_app/Models/user_response_model.dart';
import 'package:nomo_app/Storage/get_storage_file.dart';

Future<List<MyFavoriteVenues>> getMyFavouriteVenuesService() async {
  try {
    UserModel? userModel = UserPreferences.getUserModel();

    final response = await http.get(
      Uri.parse(APIEndpoints.getMyFavouriteVenues),
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
      List<dynamic> favVenueDataList = responseBody['data'];
      List<MyFavoriteVenues> favVenuesList = favVenueDataList.map((venueData) {
        return MyFavoriteVenues.fromMap(venueData);
      }).toList();

      log('FAV Venues list: $favVenuesList');
      return favVenuesList;
    } else {
      throw 'Failed to get FAV venues';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
