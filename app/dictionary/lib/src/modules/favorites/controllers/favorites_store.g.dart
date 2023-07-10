// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStoreBase, Store {
  late final _$favoritesListAtom =
      Atom(name: '_FavoritesStoreBase.favoritesList', context: context);

  @override
  ObservableList<dynamic> get favoritesList {
    _$favoritesListAtom.reportRead();
    return super.favoritesList;
  }

  @override
  set favoritesList(ObservableList<dynamic> value) {
    _$favoritesListAtom.reportWrite(value, super.favoritesList, () {
      super.favoritesList = value;
    });
  }

  late final _$isFavAtom =
      Atom(name: '_FavoritesStoreBase.isFav', context: context);

  @override
  bool get isFav {
    _$isFavAtom.reportRead();
    return super.isFav;
  }

  @override
  set isFav(bool value) {
    _$isFavAtom.reportWrite(value, super.isFav, () {
      super.isFav = value;
    });
  }

  late final _$_FavoritesStoreBaseActionController =
      ActionController(name: '_FavoritesStoreBase', context: context);

  @override
  void add(String word) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.add');
    try {
      return super.add(word);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String word) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.remove');
    try {
      return super.remove(word);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavoriteStatus(String word) {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.setFavoriteStatus');
    try {
      return super.setFavoriteStatus(word);
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesList: ${favoritesList},
isFav: ${isFav}
    ''';
  }
}
