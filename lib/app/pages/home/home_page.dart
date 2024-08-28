import 'dart:convert';
import 'package:forkify_app/app/shared/themes/app_text_styles.dart';
import 'package:forkify_app/app/shared/widgets/recipe_list_tile/recipe_list_tile_widget.dart';
import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';
import 'package:forkify_app/app/shared/widgets/search_bar/search_bar_widget.dart';
import 'package:forkify_app/app/shared/widgets/search_bar/search_bar_controller.dart';
import 'package:forkify_app/app/shared/controllers/favorites_controller.dart';
import 'package:forkify_app/app/services/api/external/search_get.dart';
import 'package:forkify_app/app/pages/home/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller =
      Provider.of<HomeController>(context, listen: false);
  late FavoritesController favoritesController =
      Provider.of<FavoritesController>(context, listen: false);
  SearchBarController searchBarController = SearchBarController();
  TextEditingController searchTextEdittingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    favoritesController.refreshCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forkify"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/favotires",
              );
            },
            icon: Observer(builder: (context) {
              return Badge(
                isLabelVisible: favoritesController.itemCount != 0,
                label: Text(favoritesController.itemCount.toString()),
                child: const Icon(CupertinoIcons.suit_heart),
              );
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBarWidget(
              controller: searchBarController,
              onSubmitted: (value) async {
                controller.setHasError(null);
                controller.setLoadingState(true);
                final response = await SearchRecipes.fetch(value);
                if (response is Map) {
                  controller.setHasError(response["error"]);
                }
                controller.setRecipeTiles(response as List<RecipeTileModel>);
                controller.setLoadingState(false);
                controller.setSearchState(!controller.isSearching);
              },
            ),
            Observer(
              builder: (context) {
                if (controller.recipeTiles.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "O que cozinhar?",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.title,
                        ),
                        Text(
                          "Pesquise e descubra receitas!",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subtile,
                        ),
                        Lottie.asset("assets/lotties/welcome.json"),
                      ],
                    ),
                  );
                }
                if (controller.error != null) {
                  return Column(
                    children: [
                      Lottie.asset("assets/lotties/error.json", repeat: false),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            Text(
                              "Ops, tivemos um erro!",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.title
                                  .copyWith(color: Colors.red),
                            ),
                            Text(
                              controller.error!,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.subtile,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:
                      controller.isLoading ? 10 : controller.recipeTiles.length,
                  itemBuilder: (context, index) {
                    final RecipeTileModel? recipe = controller.isLoading
                        ? null
                        : controller.recipeTiles[index];
                    return RecipeListTileWidget(
                      recipe: recipe,
                      onDoubleTap: () async {
                        String recipeJson = jsonEncode(recipe);
                        final prefs = await SharedPreferences.getInstance();

                        var favoritos = prefs.getStringList("favoritos")!;

                        if (favoritos.contains(recipeJson)) {
                          favoritos.remove(recipeJson);
                        } else {
                          favoritos.add(recipeJson);
                        }
                        await prefs
                            .setStringList("favoritos", favoritos)
                            .then((value) {});

                        favoritesController.refreshCount();
                      },
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return Visibility(
            visible: !searchBarController.isSearching,
            child: FloatingActionButton(
              onPressed: () async {
                searchBarController.setSearchState(true);
              },
              tooltip: 'Pesquisar',
              child: Icon(
                searchBarController.isSearching ? Icons.check : Icons.search,
              ),
            ),
          );
        },
      ),
    );
  }
}
