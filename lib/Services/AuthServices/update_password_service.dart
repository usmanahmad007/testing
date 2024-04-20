import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';

Future<bool> updatePasswordService(
    {required String userID, required String password}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.updateuserPassword),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userID.trim(), 'password': password.trim()}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Request failed';
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}
