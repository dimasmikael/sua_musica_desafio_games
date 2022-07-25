import 'package:rxdart/subjects.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/model/game_models/plataforma_model.dart';
import 'package:sua_musica_desafio_games/model/game_response.dart';
import 'package:sua_musica_desafio_games/repository/repository.dart';

class GetGamesBloc {
  final GameRepository _repository = GameRepository();
  final BehaviorSubject<GameResponse> _subject =
      BehaviorSubject<GameResponse>();

  getGames() async {
    GameResponse response = await _repository.getGames2();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GameResponse> get subject => _subject;
}

final getGamesBloc = GetGamesBloc();
