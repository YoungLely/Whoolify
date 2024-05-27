import 'package:rxdart/rxdart.dart';
import 'package:wholify/src/models/authorization_model.dart';
import 'package:wholify/src/resources/repository.dart';


class AuthorizationBloc {
  final _repository = RepositoryAuthorization();

  final PublishSubject<String> _authorizationCodeFetcher =
      PublishSubject<String>();
  final PublishSubject<AuthorizationModel> _authorizationTokenFetcher =
      PublishSubject<AuthorizationModel>();

  Stream<String> get authorizationCode => _authorizationCodeFetcher.stream;
  Stream<AuthorizationModel> get authorizationToken =>
      _authorizationTokenFetcher.stream;

  fetchAuthorizationCode() async {
    String? code = await _repository.fetchAuthorizationCode();
    if (code != null) {
      _authorizationCodeFetcher.sink.add(code);
    } else {
      // Handle null code if needed
    }
  }

  fetchAuthorizationToken(String code) async {
    AuthorizationModel authorizationModel =
        await _repository.fetchAuthorizationToken(code);
    _authorizationTokenFetcher.sink.add(authorizationModel);
  }

  dispose() {
    _authorizationCodeFetcher.close();
    _authorizationTokenFetcher.close();
  }
}

final AuthorizationBloc authorizationBloc = AuthorizationBloc();
