import 'package:flutter/material.dart';
import 'package:forkify_app/app/pages/home/home_controller.dart';
import 'package:forkify_app/app/shared/controllers/favorites_controller.dart';
import 'package:forkify_app/app/shared/themes/appcolors.dart';
import 'package:forkify_app/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getStringList("favoritos") == null) {
    prefs.setStringList("favoritos", []);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FavoritesController>(create: (_) => FavoritesController()),
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Forkify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        routes: Navigation.routes,
      ),
    );
  }
}
