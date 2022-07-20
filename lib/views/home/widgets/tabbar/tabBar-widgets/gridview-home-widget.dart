import 'package:flutter/material.dart';
import 'package:sua_musica_desafio_games/views/details/details-view.dart';

class GridViewTabBarWidget extends StatelessWidget {
  const GridViewTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child:
      GestureDetector(
      onTap: () {
    Navigator.push(
    context,
    PageRouteBuilder(
    pageBuilder: (context, a, b) =>
    const DetailsView(),
    ),
    );
    },
    child:

      GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text("name"),
          );
        },
      ), ),
    );
  }
}
