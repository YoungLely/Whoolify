import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:wholify/src/models/authorization_model.dart';
import 'package:wholify/src/utils/Strings.dart';

class AuthorizationTokenApiProvider {
  Client client = Client();
  static String client_id = client_ID;
  static String client_secret = client_Secret;

  static String AuthorizationStr = "$client_id:$client_secret";
  static var bytes = utf8.encode(AuthorizationStr);
  static var base64Str = base64.encode(bytes);

  String Authorization = 'Basic ' + base64Str;

  Uri urlToToken = Uri.parse('https://accounts.spotify.com/api/token');

  Future<AuthorizationModel> fetchToken(String code) async {
    var response = await client.post(urlToToken, body: {
      'grant_type': "authorization_code",
      'code': code,
      'redirect_uri':
          'whoolify://callback'
    }, headers: {
      'Authorization': Authorization
    });

    if (response.statusCode == 200) {
      return AuthorizationModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
