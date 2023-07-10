// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on _HistoryStoreBase, Store {
  late final _$historyListAtom =
      Atom(name: '_HistoryStoreBase.historyList', context: context);

  @override
  ObservableList<dynamic> get historyList {
    _$historyListAtom.reportRead();
    return super.historyList;
  }

  @override
  set historyList(ObservableList<dynamic> value) {
    _$historyListAtom.reportWrite(value, super.historyList, () {
      super.historyList = value;
    });
  }

  late final _$_HistoryStoreBaseActionController =
      ActionController(name: '_HistoryStoreBase', context: context);

  @override
  void add(String word) {
    final _$actionInfo = _$_HistoryStoreBaseActionController.startAction(
        name: '_HistoryStoreBase.add');
    try {
      return super.add(word);
    } finally {
      _$_HistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historyList: ${historyList}
    ''';
  }
}
