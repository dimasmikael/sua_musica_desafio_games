import 'package:sua_musica_desafio_games/model/game_models/screenshot.dart';

class ImagemResponse {
  final List<ScreenshotModel>? imagens;
  final String? error;

  ImagemResponse(this.imagens, this.error);

  ImagemResponse.fromJson(List json)
      : imagens = json.map((i) => ScreenshotModel.fromJson(i)).toList(),
        error = "";

  ImagemResponse.withError(String errorValue)
      : imagens = [],
        error = errorValue;
}
