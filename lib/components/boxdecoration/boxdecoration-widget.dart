import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-app.dart';



BoxDecoration myBoxDecoration(double larguraBorda) {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: ColorsApp.corBordaContainer, width: larguraBorda),
  );
}
