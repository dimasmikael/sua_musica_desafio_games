import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_desafio_games/bloc/get_games_bloc.dart';
import 'package:sua_musica_desafio_games/components/custom-appbar/custom-appbar-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/provider/game_provider/game_provider_model.dart';
import 'package:sua_musica_desafio_games/repository/repository.dart';
import 'package:sua_musica_desafio_games/services/game-services.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabbar-home-widget.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // GetGamesBloc? _gamesBloc;
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _gamesBloc = GetGamesBloc();
  // }

  @override
  Widget build(BuildContext context) {
    // GameServices? services = GameServices.get(context);
    // services?.gameModel!.id == "223333";
    //
    // print(services?.gameModel?.id ?? "kkk");



    SizeConfig().init(context);

    // String mainUrl = "https://api.igdb.com/v4";
    //  var gameListUrl = '$mainUrl/games';
    //   String apiKey = "sdvq04oind5o4fsts5g4uh46frsx42";
    //
    //  Future<GameResponse> getGames2([int? platformId]) async {
    //    var response = await http.post(Uri.parse("https://api.igdb.com/v4/games/?fields=*&name=*"),
    //        headers: {
    //      "Accept": "application/json",
    //      "Client-ID": "$apiKey","Authorization": "Bearer d2l2wc1ys6rqkuw9sxxg6ok3u92fqs"},
    //        body: "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*, platforms.platform_logo.*, player_perspectives.*,popularity,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;");
    //    print("${response.statusCode}");
    //    print(response.body);
    //    return GameResponse.fromJson(jsonDecode(response.body));
    //  }

    //   getGames2();

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
