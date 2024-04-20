import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';

Future<List<String>> suggestUserNameService({required String fullName}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.suggestUsernames),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'fullName': fullName.trim()}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == false) {
        throw 'Failed to suggest usernames';
      }
      List<String> mappedData = (responseBody['data'] as List<dynamic>)
          .map<String>((element) => element.toString())
          .toList();

      return mappedData;
    } else {
      throw 'Failed to suggest usernames';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
