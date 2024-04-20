import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> generateImagePublicURLSingleImage(
    {required File imageFile}) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://images.cs24ryk.com/api/image-upload"));
    request.headers['Content-Type'] = 'multipart/form-data';
    var imageFilePath =
        await http.MultipartFile.fromPath("image", imageFile.path);
    request.files.add(imageFilePath);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    debugPrint("Response: ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      var imagePublicURl = responseBody["data"]["image"];
      log(imagePublicURl);
      return imagePublicURl;
    } else {
      throw Exception('Failed to generate: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Failed to generate: $e');
    throw Exception('Failed to generate: $e');
  }
}
