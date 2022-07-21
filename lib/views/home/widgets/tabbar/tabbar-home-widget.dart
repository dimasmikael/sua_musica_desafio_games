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
    with SingleTickerProviderStateMixin {
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  bool showTab = true;

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

  @override
  void initState() {
    tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
              // showTab
              //     ? Container(
              //   constraints: BoxConstraints(maxHeight: 150.0),
              //   child: Material(
              //       color: Colors.blue,
              //       child: TabBar(
              //         controller: tabController,
              //         isScrollable: false,
              //         indicatorColor: Color(0xFFFBD30E),
              //         indicatorWeight: 3,
              //         tabs: _tabs
              //             .map((category) => Tab(text: category))
              //             .toList(),
              //       )),
              // )
              //     : Container(),
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
                height: SizeConfig.safeBlockVertical! * 80,
                child: TabBarView(
                  children: <Widget>[
                    GridViewTabBarWidget(),
                    GridViewTabBarWidget(),
                    GridViewTabBarWidget(),
                  ],
                ),
              )

              // const TabBarView(
              //      children: <Widget>[
              //
              //        // GridViewTabBarWidget(),
              //        // GridViewTabBarWidget(),
              //        // GridViewTabBarWidget(),
              //      ],
              //    ),
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
