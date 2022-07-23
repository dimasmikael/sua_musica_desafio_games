import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/custom-appbar/custom-appbar-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabbar-home-widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          texto: textoAppBar("Game Lovers App"),
        ),
        body: Center(
          child: SizedBox(
            height: SizeConfig.screenHeight!,
            child: Column(children: const [
              Expanded(
                child: TabBarHomeWidget(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
