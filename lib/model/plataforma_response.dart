import 'dart:io';

import 'package:sua_musica_desafio_games/model/game_models/platform.dart';

import 'game.dart';

class PlataformaResponse {
  final List< PlatformModel>? plataformas;
  final String? error;

  PlataformaResponse(this. plataformas, this.error);

  PlataformaResponse.fromJson(List json)
    :  plataformas = json.map((i) =>  PlatformModel.fromJson(i)).toList(),
      error = "";

  PlataformaResponse.withError(String errorValue)
    :  plataformas = [],
      error = errorValue;
}