import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabbar-home-widget.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      SafeArea(
        child: DefaultTabController(
          initialIndex:  0,
          length: 3,  child: Scaffold(
          appBar: AppBar(
            title: const Text("Curadoria - TI"),
            // bottom: const TabBar(
            //   indicatorColor: Colors.black,
            //   tabs: <Widget>[
            //     Tab(icon : Icon(Icons.android,color: Colors.amber,)),
            //     Tab(icon : Icon(Icons.cloud_download,color: Colors.amber,)), Tab(icon : Icon(Icons.safety_check,color: Colors.amber,))
            //   ],
            //   // onTap: (index) {
            //   //   setState(() {
            //   //     widget.indexAba = index;
            //   //   });
            //   // },
            // ),
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TabBarHomeWidget()
          ],
        ),
      ),
    ),),  );
  }
}
