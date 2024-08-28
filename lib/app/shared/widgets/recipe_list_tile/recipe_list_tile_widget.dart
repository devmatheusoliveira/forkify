import 'dart:convert';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';
import 'package:forkify_app/app/shared/themes/app_text_styles.dart';
import 'package:forkify_app/app/shared/widgets/recipe_list_tile/recipe_list_tile_controller.dart';
import 'package:shimmer/shimmer.dart';

class RecipeListTileWidget extends StatefulWidget {
  final RecipeTileModel? recipe;
  final Function() onTap;
  final Function() onDoubleTap;
  const RecipeListTileWidget({
    super.key,
    this.recipe,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  State<RecipeListTileWidget> createState() => _RecipeListTileWidgetState();
}

class _RecipeListTileWidgetState extends State<RecipeListTileWidget> {
  late String recipeJson = jsonEncode(widget.recipe!);
  final RecipeListTileController controller = RecipeListTileController();

  @override
  Widget build(BuildContext context) {
    if (widget.recipe != null) {
      controller.verifyFavoritesList(widget.recipe!);
      return AnimatedCard(
        direction: AnimatedCardDirection.left,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/recipe",
              arguments: widget.recipe!.recipe_id,
            );
          },
          onDoubleTap: () async {
            controller.setIsFavotite(!controller.isFavorite);
            widget.onDoubleTap.call();
          },
          child: ListTile(
            title: Text(
              widget.recipe!.title,
              style: AppTextStyles.listTileTitle,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                widget.recipe!.image_url,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            subtitle: Text(
              widget.recipe!.publisher,
              style: AppTextStyles.listTileDescription,
            ),
            trailing: Observer(builder: (context) {
              return AnimatedCrossFade(
                crossFadeState: controller.isFavorite
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(
                  milliseconds: 200,
                ),
                firstCurve: Curves.easeIn,
                secondCurve: Curves.easeOut,
                firstChild: const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
                secondChild: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.grey,
                ),
              );
            }),
          ),
        ),
      );
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: ListTile(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            color: Colors.white,
            width: 50,
            height: 20,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            color: Colors.white,
            width: 50,
            height: 50,
          ),
        ),
        subtitle: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            color: Colors.white,
            width: 50,
            height: 16,
          ),
        ),
      ),
    );
  }
}
