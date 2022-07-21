import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sua_musica_desafio_games/components/boxdecoration/boxdecoration-widget.dart';
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
          //color: Colors.green,
          height: altura,
          width: largura,
          child: Hero(
            tag:
                'https://pixabay.com/pt/vectors/controlador-nintendo-n64-3297950/' ??
                    imagePlaceHolder,
            child: CachedNetworkImage(
              imageUrl:
                  'https://pixabay.com/pt/vectors/controlador-nintendo-n64-3297950/' ??
                      imagePlaceHolder,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, i) =>
                  const SpinKitFadingCircle(color: Colors.amber),
              errorWidget: (context, i, error) =>
                  Image.network(imagePlaceHolder),
            ),
          ),
        ),
      ],
    );
  }
}
