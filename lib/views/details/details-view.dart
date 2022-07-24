import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/components/custom-appbar/custom-appbar-widget.dart';
import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
import 'package:sua_musica_desafio_games/views/details/widgets/texto-details-widget.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: Center(
        child: SizedBox(
          height: SizeConfig.screenHeight!,
          child: SingleChildScrollView(
            child: Column(
              children: [const TextoDetailsWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
