import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-app.dart';

abstract class ColorStatusBar {
  static setDefaultNavigationAndStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: ColorsApp.corStatusBar,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
  }
}
