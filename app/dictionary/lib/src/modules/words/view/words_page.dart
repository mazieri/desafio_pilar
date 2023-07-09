import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../src_exports.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    var wordsJson = Modular.get<WordsJsonImport>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Words List"),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          () => wordsJson.loadJson(),
        ),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? Scrollbar(
                  child: GridView.count(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    crossAxisCount: 3,
                    children: List.generate(
                      wordsJson.getJsonLenght,
                      (index) {
                        String clickWord = wordsJson.getWordsList[index];

                        return Card(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 10,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              Modular.to.pushNamed("/word/$clickWord");
                            },
                            child: Center(
                              child: Text(
                                "${wordsJson.getWordsList[index]}",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
