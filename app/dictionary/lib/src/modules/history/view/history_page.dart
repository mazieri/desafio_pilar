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
        return historyStore.historyList.isEmpty
            ? const Center(
                child: Card(
                  child: ListTile(
                    title: Text(
                      "Oops, you still haven't visited a word to have history !",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Scrollbar(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  itemCount: historyStore.historyList.length,
                  separatorBuilder: (_, index) => Divider(
                    indent: 1,
                    color: const Color.fromARGB(255, 125, 125, 125)
                        .withOpacity(0.5),
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
