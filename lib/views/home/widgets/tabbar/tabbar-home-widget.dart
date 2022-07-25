import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_desafio_games/bloc/get_games_bloc.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/model/game.dart';
import 'package:sua_musica_desafio_games/model/game_models/plataforma_model.dart';
import 'package:sua_musica_desafio_games/model/game_models/platform.dart';
import 'package:sua_musica_desafio_games/model/plataforma_response.dart';
import 'package:sua_musica_desafio_games/provider/game_provider/game_provider_model.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-app.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabBar-widgets/gridview-home/gridview-home-widget.dart';

class TabBarHomeWidget extends StatefulWidget {
  const TabBarHomeWidget({Key? key}) : super(key: key);

  @override
  State<TabBarHomeWidget> createState() => _TabBarHomeWidgetState();
}

class _TabBarHomeWidgetState extends State<TabBarHomeWidget>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
   //int? platformId;
  @override
  void initState() {
    super.initState();
   // _carregarDadosGame();
    print("segundo");

    getGamesBloc.getPlataforma();


  }

  // GameResponse? gameResponse;
  // List<GameModel>? games;
  // Future<GameModel?>? _carregarDadosGame() async {
  //  // BaseService.loading.start(context);
  //
  //   try {
  //     GameModel? gameApi = await getGamesBloc.subject.stream.);
  //   //  List<PetModel>? gatosApi = await PetController.getGatos();
  //
  //     setState(
  //           () {
  //             game = gameApi;
  //       //  gatos = gatosApi;
  //       },
  //     );
  //
  //  print(game?.id?? "llll");
  //
  //   //  BaseService.loading.stop(context);
  //   } catch (e) {
  // //    BaseService.loading.stop(context);
  //     print(e);
  //   }
  // }

  // static final List<Widget> _tabs = [
  //   Tab(
  //     child: textoLabelTabBar('Nintendo 64'),
  //   ),
  //   Tab(
  //     child: textoLabelTabBar('Playstation 4'),
  //   ),
  //   Tab(
  //     child: textoLabelTabBar('Xbox One'),
  //   ),
  // ];

 TabController? _tabController;

  Widget tabBarWidget([PlataformaResponse? data]) {
  //  gameResponse= Provider.of<GameModel>(context)  ;

    List< PlatformModel>? plataformas = data?. plataformas;

    //  print("games!.length ??00");print(games![0].name);


    //GameModel? games = data;

    //print(data?.games?[0].plataforma?.length ??0);

   // print(games?.id ?? "00");

    return DefaultTabController(
      length: plataformas!.length,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: TabBar(
                isScrollable: true,
                  labelPadding: const EdgeInsets.only(top: 10,left: 5),
                  labelColor: ColorsApp.corLabelTabBar,
                  unselectedLabelColor: ColorsApp.corUnselectedLabelTabBar,
                  indicatorColor: ColorsApp.corIndicatorTabBar,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs:  plataformas!.map((PlatformModel plataforma) {
                    return Tab(
                      text:  plataforma.name,
                     // icon: Icon(choice.icon),
                    );
                  }).toList(),
    ),

    ),
    ),


          Expanded(
            flex: 8,
            child: Container(
              child:

              TabBarView(
                controller: _tabController,
                children: plataformas.isEmpty
                    ? <Widget>[]
                    : plataformas.map((dynamicContent) {
                  return GridViewTabBarWidget(plataformas );
                }).toList(),
              ),



              // TabBarView(children: <Widget>[
              //   GridViewTabBarWidget(plataformas ),
              //   GridViewTabBarWidget(plataformas  ),
              //   GridViewTabBarWidget(plataformas  ),
              // ]),
            ),
          ), // showTab
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //return tabBarWidget();
// print("primeiro");
//     gameResponse= Provider.of<GameResponse>(context)  ;

    //getGamesBloc.getGames();

    return  StreamBuilder<PlataformaResponse>(
      stream: getGamesBloc.subject1.stream,
      builder: (context, AsyncSnapshot<PlataformaResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.error != null && snapshot.data!.error!.length > 0) {
            return Text(snapshot.data?.error.toString() ??"eeero");
          }
          return  tabBarWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return Text(snapshot.data?.error.toString() ??"eeero");
        } else {
          return buildLoadingWidget();
        }
      },
    );

  //    tabBarWidget(getGamesBloc.getGames());
  }
    //   StreamBuilder<GameResponse>(
    //   stream: getGamesBloc.subject.stream,
    //   builder: (context, AsyncSnapshot<GameResponse> snapshot) {
    //     // if (snapshot.hasData) {
    //     //   if ( snapshot.data!.error!=null) {
    //     //     return Container(color: Colors.blue,);
    //     //   }
    //       return tabBarWidget(snapshot.data);
    //
    //     // } else {
    //     //   return buildLoadingWidget();
    //     // }
    //   },
    // );}
  @override
  bool get wantKeepAlive => true;
  }






Widget buildLoadingWidget() {
  return Center(
    child: Column(
      children: [
        CupertinoActivityIndicator()
      ],
    ),
  );
}