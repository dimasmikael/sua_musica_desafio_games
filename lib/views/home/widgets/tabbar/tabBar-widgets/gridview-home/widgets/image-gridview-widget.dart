import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sua_musica_desafio_games/components/boxdecoration/boxdecoration-widget.dart';
import 'package:sua_musica_desafio_games/components/image/image-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/shared/image-placeholder/image-placeholder-widget.dart';

class ImageGridViewWidget extends StatefulWidget {
  const ImageGridViewWidget({Key? key}) : super(key: key);

  @override
  State<ImageGridViewWidget> createState() => _ImageGridViewWidgetState();
}

class _ImageGridViewWidgetState extends State<ImageGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double altura = SizeConfig.screenHeight! * .13;
    double largura = SizeConfig.screenWidth! * .30;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: myBoxDecoration(2.0),
            height: altura,
            width: largura,
            child: const ImageWidget()),
      ],
    );
  }
}
