import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-statusbar.dart';
import 'package:sua_musica_desafio_games/views/home/home-view.dart';

void main() {
  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
