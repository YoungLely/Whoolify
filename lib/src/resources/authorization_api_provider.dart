import 'dart:async';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' show Client;
import 'package:wholify/src/utils/Strings.dart';

class AuthorizationApiProvider {
  Client client = Client();

  static String url = "https://accounts.spotify.com/authorize";
  static String client_id = client_ID;
  static String response_type = "code";
  static String redirect_uri = "whoolify://callback";
  static String scope =
      "playlist-read-private playlist-read-collaborative user-top-read user-library-modify playlist-modify-public playlist-modify-private";

  static String state = "34fFs29kd09";

  String urlDireccion =
      "$url?client_id=$client_id&response_type=$response_type&redirect_uri=$redirect_uri&scope=$scope&state=$state";

  Future<String?> fetchCode() async {
    try {
      final response = await FlutterWebAuth.authenticate(
          url: urlDireccion, callbackUrlScheme: 'whoolify');

      if (response.isNotEmpty) {
        final error = Uri.parse(response).queryParameters['error'];
        if (error == null) {
          final code = Uri.parse(response).queryParameters['code'];
          return code;
        } else {
          print("Error al autenticar: $error");
          return null;
        }
      } else {
        print("El usuario canceló la autenticación.");
        return null; // Opcional: puedes lanzar una excepción aquí si deseas.
      }
    } catch (e) {
      print("Error al autenticar: $e");
      return null;
    }
  }
}
