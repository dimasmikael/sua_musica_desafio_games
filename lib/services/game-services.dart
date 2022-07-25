import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_desafio_games/model/game.dart';

class GameServices {
  static GameServices? get(BuildContext context, {bool listen = false}) =>
      Provider.of<GameServices>(context, listen: listen);
  GameModel? gameModel;

  GameServices({required this.gameModel});
}
