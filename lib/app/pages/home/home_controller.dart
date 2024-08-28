import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  @observable
  bool isLoading = false;
  @observable
  bool isSearching = false;
  @observable
  String? error;
  @observable
  var recipeTiles = ObservableList<RecipeTileModel>.of([]);

  @action
  void setRecipeTiles(List<RecipeTileModel> value) =>
      recipeTiles = ObservableList<RecipeTileModel>.of(value);

  @action
  void setSearchState(bool value) => isSearching = value;
  @action
  void setHasError(String? value) => error = value;

  @action
  Future<void> refresh() async {
    setLoadingState(true);
    setLoadingState(false);
  }

  @action
  void setLoadingState(bool value) => isLoading = value;
}
