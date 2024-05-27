import 'package:rxdart/rxdart.dart';
import 'package:wholify/src/models/list_playlist_model.dart';
import 'package:wholify/src/models/track_playlist_model.dart';
import 'package:wholify/src/resources/repository.dart';

class PlaylistBloc {
  final _repository = RepositoryPlaylist();

  final PublishSubject<ListPlaylistModel> _playlistListFetcher =
      PublishSubject<ListPlaylistModel>();
  final PublishSubject<TracksPlaylistModel> _tracksListFetcher =
      PublishSubject<TracksPlaylistModel>();

  Stream<ListPlaylistModel> get playlistList => _playlistListFetcher.stream;
  Stream<TracksPlaylistModel> get tracksList => _tracksListFetcher.stream;

  fetchPlaylistList() async {
    ListPlaylistModel playlistList = await _repository.fetchPlaylistList();
    _playlistListFetcher.sink.add(playlistList);
  }

  fetchTracksList(String url) async {
    TracksPlaylistModel tracksList = await _repository.fetchTracksList(url);
    _tracksListFetcher.sink.add(tracksList);
  }

  dispose() {
    _playlistListFetcher.close();
    _tracksListFetcher.close();
  }
}

final PlaylistBloc playlistBloc = PlaylistBloc();
