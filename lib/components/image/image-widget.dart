import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sua_musica_desafio_games/shared/image-placeholder/image-placeholder-widget.dart';
class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:

      imagePlaceHolder,
      child:
      CachedNetworkImage(
        imageUrl:

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
    );
  }
}
