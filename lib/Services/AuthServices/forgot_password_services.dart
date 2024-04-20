import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nomo_app/Global/apis.dart';

Future<bool> forgotPasswordService({required String email}) async {
  try {
    final response = await http.post(
      Uri.parse(APIEndpoints.forgotPassbyEmail),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email.trim()}),
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
