// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  // --- @observable --- //

  @observable
  var favoritesList = ObservableList();

  @observable
  bool isFav = false;

  // --- @action --- //

  @action
  void add(String word) {
    favoritesList.add(word);
  }

  @action
  void remove(String word) {
    favoritesList.remove(word);
  }

  @action
  void setFavoriteStatus(String word) {
    favoritesList.contains(word) == true
        ? {isFav = false, favoritesList.remove(word)}
        : {
            isFav = true,
            favoritesList.add(word),
          };
  }
}
