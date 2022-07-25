import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sua_musica_desafio_games/bloc/get_games_bloc.dart';
import 'package:sua_musica_desafio_games/components/boxdecoration/boxdecoration-widget.dart';
import 'package:sua_musica_desafio_games/components/image/image-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/model/game_models/screenshot.dart';
import 'package:sua_musica_desafio_games/model/imagem_response.dart';
import 'package:sua_musica_desafio_games/shared/image-placeholder/image-placeholder-widget.dart';

class ImageGridViewWidget extends StatefulWidget {
  const ImageGridViewWidget(this.id,  {Key? key}) : super(key: key);

  final int id;

  @override
  State<ImageGridViewWidget> createState() => _ImageGridViewWidgetState();
}

class _ImageGridViewWidgetState extends State<ImageGridViewWidget> {

  @override
  void initState() {
    super.initState();


    getGamesBloc.getImagens(widget!.id);
  }

  Widget imagens(ImagemResponse? data){

    List<ScreenshotModel>? imagems = data?.imagens;

    print("imagems!.length"); print(imagems!.length);

    double altura = SizeConfig.screenHeight! * .13;
    double largura = SizeConfig.screenWidth! * .30;
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: myBoxDecoration(2.0),
              height: altura,
              width: largura,
              child:  ImageWidget(imagems)),
        ],
      );


  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);



    return


      StreamBuilder<ImagemResponse>(
        stream: getGamesBloc.subject3.stream,
        builder: (context, AsyncSnapshot<ImagemResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.error != null &&
                snapshot.data!.error!.length > 0) {
              return Text(snapshot.data?.error.toString() ?? "eeero");
            }
            return imagens(snapshot.data);
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
      children: [
        CupertinoActivityIndicator()
      ],
    ),
  );
}