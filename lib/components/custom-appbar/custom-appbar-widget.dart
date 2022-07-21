import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/shared/constants/colors/colors-app.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBarWidget({Key? key, this.texto}) : super(key: key);

  final Widget? texto;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        SizeConfig.blockSizeVertical! * 12,
      ),
      child: AppBar(
          centerTitle: true,
          backgroundColor: ColorsApp.corAppBar,
          elevation: 2,
          iconTheme: IconThemeData(
              color: ColorsApp.corIconArrow,
              size: SizeConfig.safeBlockHorizontal! * 6),
          title: texto),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
