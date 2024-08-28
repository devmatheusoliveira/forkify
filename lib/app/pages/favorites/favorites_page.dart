import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forkify_app/app/pages/home/home_controller.dart';
import 'package:forkify_app/app/shared/controllers/favorites_controller.dart';
import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';
import 'package:forkify_app/app/shared/themes/app_text_styles.dart';
import 'package:forkify_app/app/shared/widgets/recipe_list_tile/recipe_list_tile_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesController favoritesController =
      Provider.of<FavoritesController>(context, listen: false);
  late HomeController homeController =
      Provider.of<HomeController>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: Observer(
        builder: (context) {
          final favoritos = favoritesController.recipeTiles;
          if (favoritos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lotties/favoritos.json"),
                  Text(
                    "Você ainda não tem favoritos!",
                    style: AppTextStyles.subtile,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: favoritos.length,
            itemBuilder: (context, index) {
              return RecipeListTileWidget(
                onDoubleTap: () async {
                  await favoritesController.remove(favoritos[index]);
                  homeController.refresh();
                },
                onTap: () {},
                recipe: RecipeTileModel.fromJson(
                  jsonDecode(
                    favoritos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
