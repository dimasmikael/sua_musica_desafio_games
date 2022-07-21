import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-app.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabBar-widgets/gridview-home/gridview-home-widget.dart';

class TabBarHomeWidget extends StatefulWidget {
  const TabBarHomeWidget({Key? key}) : super(key: key);

  @override
  State<TabBarHomeWidget> createState() => _TabBarHomeWidgetState();
}

class _TabBarHomeWidgetState extends State<TabBarHomeWidget> {
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  static  final List<Widget> _tabs = [
    Tab(
      child: textoLabelTabBar('Nintendo 64'),
    ),
    Tab(
      child: textoLabelTabBar('Playstation 4'),
    ),
    Tab(
      child: textoLabelTabBar('Xbox One'),
    ),
  ];

  Widget tabBarWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DefaultTabController(
          length: 3, // length of tabs
          initialIndex: 0,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TabBar(
                  // indicator: const UnderlineTabIndicator(
                  //     borderSide: BorderSide(width: 5.0),
                  //     insets: EdgeInsets.symmetric(horizontal:16.0)
                  // ),

          // indicator: UnderlineTabIndicator(
          //   borderSide: BorderSide(
          //   width: 0.1,
          //   color: ColorsApp.corLabelTabBar,
          // ),),
                  labelPadding: const EdgeInsets.only(top: 10),
                labelColor: ColorsApp.corLabelTabBar,
                  unselectedLabelColor: ColorsApp.corUnselectedLabelTabBar,
                  indicatorColor: ColorsApp.corIndicatorTabBar,
                  // indicatorPadding: EdgeInsets.all(30),

                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 100,
                child: const TabBarView(
                  children: <Widget>[
                    GridViewTabBarWidget(),
                    GridViewTabBarWidget(),
                    GridViewTabBarWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return tabBarWidget();
  }
}
