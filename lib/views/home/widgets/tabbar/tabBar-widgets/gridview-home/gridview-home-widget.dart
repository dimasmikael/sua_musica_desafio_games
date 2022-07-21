import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/boxdecoration/boxdecoration-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
import 'package:sua_musica_desafio_games/views/details/details-view.dart';
import 'package:sua_musica_desafio_games/views/home/widgets/tabbar/tabBar-widgets/gridview-home/widgets/image-gridview-widget.dart';

class GridViewTabBarWidget extends StatelessWidget {
  const GridViewTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double altura = SizeConfig.screenHeight! * 75;
    double largura = SizeConfig.screenWidth! * 100;

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
          child: Column(
            children: [
              Expanded(
                  child: GridView.builder(
               //shrinkWrap: true,
                   // scrollDirection: Axis.vertical,
                   // physics: NeverScrollableScrollPhysics(),
                    physics: ScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: largura / altura,
                ),
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: myBoxDecoration(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageGridViewWidget(),
                        textoNomeJogo("The Legend of Zelda: Majora's Mask"),
                      ],
                    ),
                  );
                },
              ))
            ],
          )),
    );
  }
}
