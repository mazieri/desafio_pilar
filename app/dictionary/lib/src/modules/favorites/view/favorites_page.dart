import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../src_exports.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    final favoritesStore = Modular.get<FavoritesStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Observer(builder: (_) {
        return Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            itemCount: favoritesStore.favoritesList.length,
            separatorBuilder: (_, index) => Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            itemBuilder: (_, index) {
              String wordIndex = favoritesStore.favoritesList[index];

              return Card(
                child: ListTile(
                    title: Text(
                      wordIndex,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        favoritesStore.remove(wordIndex);
                      },
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    )),
              );
            },
          ),
        );
      }),
    );
  }
}
