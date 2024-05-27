import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wholify/src/models/authorization_model.dart';
import 'dart:convert';

import 'package:wholify/src/models/list_playlist_model.dart';
import 'package:wholify/src/utils/Strings.dart';

class PlaylistListApiProvider {
  Client client = Client();
  var urlToPlaylist = "https://api.spotify.com/v1/me/playlists";

  Future<ListPlaylistModel> fetchPlaylistList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString("access_token")!;
    String token_type = prefs.getString("token_type")!;

    String AuthorizationWithToken = '$token_type $access_token';

    var response = await client.get(urlToPlaylist as Uri, headers: {
      'Authorization': AuthorizationWithToken,
    });

    if (response.statusCode == 401) {
      String refresh_token = prefs.getString('refresh_token')!;
      String client_d = client_ID;
      String client_s = client_Secret;
      String AuthorizationStr = "$client_d:$client_s";
      var bytes = utf8.encode(AuthorizationStr);
      var base64Str = base64.encode(bytes);
      String Authorization = 'Basic ' + base64Str;

      var responseNewToken = await client
          .post("https://accounts.spotify.com/api/token" as Uri, body: {
        'grant_type': 'refresh_token',
        'refresh_token': refresh_token,
        'redirect_uri': 'whoolify:/'
      }, headers: {
        'Authorization': Authorization
      });
      if (responseNewToken.statusCode == 200) {
        AuthorizationModel aM =
            AuthorizationModel.fromJson(json.decode(responseNewToken.body));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('access_token', aM.accessToken);
        prefs.setString('token_type', aM.tokenType);
        prefs.setBool('logged', true);

        access_token = prefs.getString('access_token')!;
        token_type = prefs.getString('token_type')!;
        String AuthorizationWithToken = '${token_type} ${access_token}';
        response = await client.get(urlToPlaylist as Uri,
            headers: {'Authorization': AuthorizationWithToken});
        print("Se dio un nuevo token!");
      } else {
        throw Exception('Failed to request a new token');
      }
    }
    if (response.statusCode == 200) {
      return ListPlaylistModel.fromJson(json.decode(response.body));
    } else {
      print("EstatusCode: ${response.statusCode}");
      print("BODY: ${response.body}");
      throw Exception('Failed to get Playlist');
    }
  }
}
