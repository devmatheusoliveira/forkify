import 'package:flutter/material.dart';
import 'package:forkify_app/app/pages/recipe/recipe_controller.dart';
import 'package:forkify_app/app/services/api/external/recipe_get.dart';
import 'package:forkify_app/app/shared/models/recipe_details/recipe_details_model.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeDetailsController controller = RecipeDetailsController();
    final recipeId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: RecipeGet.fetch(recipeId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              RecipeDetailsModel recipeDetails = snapshot.data;
              final largura = MediaQuery.of(context).size.width;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: largura,
                    child: Stack(
                      children: [
                        Image.network(
                          recipeDetails.image_url,
                          width: largura,
                          height: largura,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.transparent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ListTile(
                            title: Text(
                              recipeDetails.title,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              recipeDetails.publisher,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      "Ingredientes:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeDetails.ingredients.length,
                    itemBuilder: (context, index) => Text(
                      "• ${recipeDetails.ingredients[index]}",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async =>
                        await controller.onClickLink(recipeDetails.source_url),
                    child: const Text(
                      "Saiba mais",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
