import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sua_musica_desafio_games/model/game_models/screenshot.dart';
import 'package:sua_musica_desafio_games/shared/image-placeholder/image-placeholder-widget.dart';
class ImageWidget extends StatelessWidget {
  const ImageWidget(this.imagems,  {Key? key}) : super(key: key);
 final List<ScreenshotModel>? imagems;
  @override
  Widget build(BuildContext context) {

    String? imagem = imagems?[1].url;
    return Hero(
      tag:

      imagems?[1].url??  imagePlaceHolder,
      child:
      CachedNetworkImage(
        imageUrl:

        'https:$imagem'??
            imagePlaceHolder,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            image:
            DecorationImage(image: imageProvider, fit: BoxFit.contain),
          ),
        ),
        placeholder: (context, i) =>
        const SpinKitFadingCircle(color: Colors.amber),
        errorWidget: (context, i, error) =>
            Image.network(imagePlaceHolder),
      ),
    );
  }
}
