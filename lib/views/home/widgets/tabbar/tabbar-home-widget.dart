import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabBar-widgets/gridview-home-widget.dart';




class TabBarHomeWidget extends StatefulWidget {
  const TabBarHomeWidget({Key? key}) : super(key: key);

  @override
  State<TabBarHomeWidget> createState() => _TabBarHomeWidgetState();
}

class _TabBarHomeWidgetState extends State<TabBarHomeWidget> {

  //final _scaffoldKey = GlobalKey<ScaffoldState>();


  // static const List<Wi> _tabs = [
  // Tab(child: Text('Flight')),
  // Tab(child: Text('Train')),
  // Tab(child: Text('Car')),,
  // ];

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
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blue,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(child: Text('Flight')),
                  Tab(child: Text('Train')),
                  Tab(child: Text('Car')),

                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 100,
                child: const TabBarView(
                  children: <Widget>[
                    GridViewTabBarWidget(),GridViewTabBarWidget(),GridViewTabBarWidget(),
                    // ListagemPetsWidget((cachorros ?? []), context),
                    // ListagemPetsWidget((gatos ?? []), context),
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
