import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/bloc/get_games_bloc.dart';
import 'package:sua_musica_desafio_games/components/boxdecoration/boxdecoration-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/model/game_models/platform.dart';
import 'package:sua_musica_desafio_games/model/game_models/screenshot.dart';
import 'package:sua_musica_desafio_games/model/game_response.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/details/details-view.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabBar-widgets/gridview-home/widgets/image-gridview-widget.dart';

class GridViewTabBarWidget extends StatefulWidget {
  const GridViewTabBarWidget(this.plataformas, {Key? key}) : super(key: key);
  final List<PlatformModel>? plataformas;

  @override
  State<GridViewTabBarWidget> createState() => _GridViewTabBarWidgetState();
}

class _GridViewTabBarWidgetState extends State<GridViewTabBarWidget> {
  @override
  void initState() {
    super.initState();
    // _carregarDadosGame();
    print("segundo");

    getGamesBloc.getGames(48);
    //getGamesBloc.getImagens(99460);

  }

  Widget gridView(GameResponse? data) {
    double altura = SizeConfig.screenHeight! * 75;
    double largura = SizeConfig.screenWidth! * 100;

    List<GameModel>? games = data?.games;

    print("games?[0].id");    print(games?[1].id ??"k");


    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, a, b) => const DetailsView(),
              ),
            );
          },
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: games!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: largura / altura,
            ),
            itemBuilder: (BuildContext ctx, index) {
              //      getGamesBloc.getGames(widget.plataformas![index].id! );
         //List<ScreenshotModel>? imagens= games?[index]?.screenshots;

              // print(widget.plataformas ?[0]?.name ?? "kk");
              return Container(
                alignment: Alignment.center,
                decoration: myBoxDecoration(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 ImageGridViewWidget(games![1]!.id!),
                    textoNomeJogo(games?[index]?.name ?? 'kk'),
                  ],
                ),
              );
            },
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // print(games?.id ??"kk");

    return StreamBuilder<GameResponse>(
      stream: getGamesBloc.subject2.stream,
      builder: (context, AsyncSnapshot<GameResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.error != null &&
              snapshot.data!.error!.length > 0) {
            return Text(snapshot.data?.error.toString() ?? "eeero");
          }
          return gridView(snapshot.data);
        } else if (snapshot.hasError) {
          return Text(snapshot.data?.error.toString() ?? "eeero");
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }
}

Widget buildLoadingWidget() {
  return Center(
    child: Column(
      children: [CupertinoActivityIndicator()],
    ),
  );
}
