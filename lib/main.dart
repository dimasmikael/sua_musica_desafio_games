import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_desafio_games/game-interface.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/provider/game_provider/game_provider_model.dart';
import 'package:sua_musica_desafio_games/services/game-services.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-statusbar.dart';
import 'package:sua_musica_desafio_games/views/home/home-view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => GameModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorStatusBar.setDefaultNavigationAndStatusBar();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeView());
  }
}
