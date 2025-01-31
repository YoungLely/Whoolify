import 'package:wholify/src/models/authorization_model.dart';
import 'package:wholify/src/models/list_playlist_model.dart';
import 'package:wholify/src/models/track_playlist_model.dart';
import 'package:wholify/src/resources/authorizationToken_api_provider.dart';
import 'package:wholify/src/resources/authorization_api_provider.dart';
import 'package:wholify/src/resources/playlistList_api_provider.dart';
import 'package:wholify/src/resources/tracks_playlist_api_provider.dart';

class RepositoryAuthorization {
   final authorizationCodeApiProvider = AuthorizationApiProvider();
  final authorizationTokenApiProvider = AuthorizationTokenApiProvider();

  Future<String?> fetchAuthorizationCode() => authorizationCodeApiProvider.fetchCode();

  Future<AuthorizationModel> fetchAuthorizationToken(String code) => authorizationTokenApiProvider.fetchToken(code);
}

class RepositoryPlaylist {
  final playlistsListApiProvider = PlaylistListApiProvider();
  final tracksPlaylistApiProvider = TracksPlaylistApiProvider();
  Future<ListPlaylistModel> fetchPlaylistList() =>
      playlistsListApiProvider.fetchPlaylistList();
  Future<TracksPlaylistModel> fetchTracksList(String url) =>
      tracksPlaylistApiProvider.fetchTracks(url);
}
