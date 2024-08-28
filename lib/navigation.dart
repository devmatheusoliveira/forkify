import 'package:flutter/material.dart';
import 'package:forkify_app/app/pages/favorites/favorites_page.dart';
import 'package:forkify_app/app/pages/recipe/recipe_page.dart';
import 'app/pages/home/home_page.dart';

class Navigation {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomePage(),
    '/recipe': (context) => const RecipePage(),
    '/favotires': (context) => const FavoritesPage(),
  };
}
