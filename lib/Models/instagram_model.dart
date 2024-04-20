import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nomo_app/Services/instagram_service_constants.dart';
import 'package:nomo_app/res/utils/utils.dart';

class InstagramModel {
  List<String> userFields = ["id", "username", "account_type"];

  String? authorizationCode;
  String? accessToken;
  String? userID;
  String? username;

  String getAuthorizationCodefromUrl(String url) {
    String codePattern = '${InstagramConstant.redirectUri}?code=';
    String fragmentToRemove = '#_';

    if (url.contains(codePattern)) {
      authorizationCode = url.replaceAll(codePattern, '');
      if (authorizationCode!.contains(fragmentToRemove)) {
        authorizationCode = authorizationCode!.replaceAll(fragmentToRemove, '');
      }
      return authorizationCode!;
    } else {
      return '';
    }
  }

  Future<bool> getTokenAndUserID({required String authCode}) async {
    try {
      var url = Uri.parse('https://api.instagram.com/oauth/access_token');
      var body = {
        'client_id': InstagramConstant.clientID,
        'redirect_uri': InstagramConstant.redirectUri,
        'client_secret': InstagramConstant.appSecret,
        'code': authCode,
        'grant_type': 'authorization_code'
      };
      final response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      var responseBodyDecoded = jsonDecode(response.body);
      accessToken = responseBodyDecoded['access_token'].toString();
      userID = responseBodyDecoded['user_id'].toString();

      if ((accessToken?.isEmpty ?? true) || (userID?.isEmpty ?? true)) {
        throw "Login request Failed";
      }
      return (accessToken!.isNotEmpty && userID!.isNotEmpty);
    } catch (e) {
      Utils.showSnackbar(Get.context!, e.toString());
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserInstagramProfile() async {
    try {
      final fields = userFields.join(',');
      final responseNode = await http.get(Uri.parse(
          'https://graph.instagram.com/$userID?fields=$fields&access_token=$accessToken'));

      var instaProfile = {
        'id': (json.decode(responseNode.body)['id']).toString(),
        'username': json.decode(responseNode.body)['username'],
      };
      username = json.decode(responseNode.body)['username'];
      log(instaProfile.toString());
      return instaProfile;
    } catch (e) {
      Utils.showSnackbar(Get.context!, e.toString());
      rethrow;
    }
  }

  @override
  String toString() {
    return 'InstagramModel(userFields: $userFields, authorizationCode: $authorizationCode, accessToken: $accessToken, userID: $userID, username: $username)';
  }
}
