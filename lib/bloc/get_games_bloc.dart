import 'package:rxdart/subjects.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/model/game_models/plataforma_model.dart';
import 'package:sua_musica_desafio_games/model/game_response.dart';
import 'package:sua_musica_desafio_games/model/imagem_response.dart';
import 'package:sua_musica_desafio_games/model/plataforma_response.dart';
import 'package:sua_musica_desafio_games/repository/repository.dart';

class GetGamesBloc {
  final GameRepository _repository = GameRepository();
  final BehaviorSubject<PlataformaResponse> _subject1 =
      BehaviorSubject<PlataformaResponse>();
  final BehaviorSubject<GameResponse> _subject2 =
      BehaviorSubject<GameResponse>();

  final BehaviorSubject<ImagemResponse> _subject3 =
      BehaviorSubject<ImagemResponse>();

  getPlataforma() async {
    PlataformaResponse response = await _repository.getPlataforma();
    _subject1.sink.add(response);
  }

  getGames(int platformId) async {
    GameResponse response = await _repository.getGames(platformId!);
    _subject2.sink.add(response);
  }

  getImagens(int Id) async {
    ImagemResponse response = await _repository.getImagens(Id!);
    _subject3.sink.add(response);
  }

  dispose() {
    _subject1.close();
    _subject2.close();
    _subject3.close();
  }

  BehaviorSubject<PlataformaResponse> get subject1 => _subject1;

  BehaviorSubject<GameResponse> get subject2 => _subject2;

  BehaviorSubject<ImagemResponse> get subject3 => _subject3;
}

final getGamesBloc = GetGamesBloc();
