import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorites_controller.g.dart';

class FavoritesController = FavoritesBase with _$FavoritesController;

abstract class FavoritesBase with Store {
  @observable
  int itemCount = 0;
  @observable
  var recipeTiles = ObservableList<String>();

  @action
  Future<void> refreshCount() async {
    final prefs = await SharedPreferences.getInstance();
    final favotites = prefs.getStringList("favoritos")!;
    recipeTiles = ObservableList.of(favotites);
    itemCount = favotites.length;
  }

  @action
  void add(value) {
    recipeTiles.add(value);

    itemCount = recipeTiles.length;
  }

  @action
  Future<void> remove(String value) async {
    final prefs = await SharedPreferences.getInstance();
    var favoritos = prefs.getStringList("favoritos")!;
    favoritos.remove(value);
    await prefs.setStringList("favoritos", favoritos);
    itemCount = favoritos.length;
    await refreshCount();
  }
}
