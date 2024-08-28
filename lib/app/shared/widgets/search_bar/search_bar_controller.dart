import 'package:mobx/mobx.dart';
part 'search_bar_controller.g.dart';

class SearchBarController = SearchBarBase with _$SearchBarController;

abstract class SearchBarBase with Store {
  @observable
  bool isLoading = false;
  @observable
  bool isSearching = false;

  @action
  void setSearchState(bool value) => isSearching = value;
  @action
  void setLoadingState(bool value) => isLoading = value;
}
