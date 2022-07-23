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

class _TabBarHomeWidgetState extends State<TabBarHomeWidget>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  static final List<Widget> _tabs = [
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
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: TabBar(
                  labelPadding: const EdgeInsets.only(top: 10),
                  labelColor: ColorsApp.corLabelTabBar,
                  unselectedLabelColor: ColorsApp.corUnselectedLabelTabBar,
                  indicatorColor: ColorsApp.corIndicatorTabBar,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: const TabBarView(children: <Widget>[
                GridViewTabBarWidget(),
                GridViewTabBarWidget(),
                GridViewTabBarWidget(),
              ]),
            ),
          ), // showTab
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return tabBarWidget();
  }

  @override
  bool get wantKeepAlive => true;
}
