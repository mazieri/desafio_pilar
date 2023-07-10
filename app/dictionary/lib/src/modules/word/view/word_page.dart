import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../src_exports.dart';
import '../controllers/word_controllers_exports.dart';

class WordPage extends StatelessWidget {
  final String clickWord;
  final int indexWord;

  const WordPage({super.key, required this.clickWord, required this.indexWord});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    final controller = Modular.get<WordPageController>();
    final wordsJson = Modular.get<WordsJsonImport>();
    final historyStore = Modular.get<HistoryStore>();
    final favoritesStore = Modular.get<FavoritesStore>();

    int indexNextWord =
        indexWord == wordsJson.getJsonLenght - 1 ? 0 : indexWord + 1;
    String nextWord = wordsJson.getWordsList[indexNextWord];

    return Scaffold(
      appBar: AppBar(
        title: Text("Word \"$clickWord\""),
        actions: [
          Observer(builder: (_) {
            return IconButton(
              onPressed: () {
                favoritesStore.setFavoriteStatus(clickWord);
              },
              icon: favoritesStore.favoritesList.contains(clickWord) == true
                  ? const Icon(
                      Icons.favorite,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          historyStore.add(clickWord);
          Modular.to.popAndPushNamed(
            "/word/$nextWord",
            arguments: indexNextWord,
          );
        },
        label: const Text("Próximo"),
      ),
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 3),
          () => controller.getWord(clickWord),
        ),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data["message"] == ""
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: height / 3,
                            width: double.maxFinite,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    clickWord,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data["pronunciation"]["all"] ??
                                        "Don't have a pronunciation",
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          const Text(
                            "Meanings",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data["results"].length,
                            separatorBuilder: (_, index) => Divider(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            itemBuilder: (_, index) {
                              int showIndex = index + 1;
                              String definition =
                                  snapshot.data["results"][index]["definition"];
                              String partOfSpeech = snapshot.data["results"]
                                  [index]["partOfSpeech"];
                              int length = snapshot.data["results"].length;

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "$showIndexº: ",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "$partOfSpeech - ",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: definition,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  showIndex == length
                                      ? SizedBox(
                                          height: height / 12,
                                        )
                                      : Container(),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "Sorry, but ${snapshot.data["message"]}... \n Please, try the next word or return back",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sorry for the inconvenience, but there was a connection error !",
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: const Text('Return'),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
