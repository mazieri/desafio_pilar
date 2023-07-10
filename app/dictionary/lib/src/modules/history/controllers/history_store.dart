// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'history_store.g.dart';

class HistoryStore = _HistoryStoreBase with _$HistoryStore;

abstract class _HistoryStoreBase with Store {
  // --- @observable --- //

  @observable
  var historyList = ObservableList();

  // --- @action --- //

  @action
  void add(String word) {
    historyList.contains(word) == true ? null : historyList.add(word);
  }
}
