import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../src_exports.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    final historyStore = Modular.get<HistoryStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Observer(builder: (_) {
        return Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            itemCount: historyStore.historyList.length,
            separatorBuilder: (_, index) => Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            itemBuilder: (_, index) {
              String wordIndex = historyStore.historyList[index];

              return Card(
                child: ListTile(
                  title: Text(
                    wordIndex,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
