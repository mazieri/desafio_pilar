import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../src_exports.dart';
import '../data/word_data_exports.dart';
import '../models/word_models_exports.dart';

class WordPage extends StatelessWidget {
  final String clickWord;

  const WordPage({super.key, required this.clickWord});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    final client = Modular.get<UnoHttp>();

    Future<WordModel> getWord(String word) async {
      final response = await client.get(
        "$wordsApiUrl$word",
        {
          "X-RapidAPI-Host": wordsApiHeaderHost,
          "x-rapidapi-key": wordsApiHeaderKey
        },
        {},
      );

      try {
        switch (response.status) {
          case 200:
            return WordModel.fromJson(response.data);

          default:
            throw Exception('Failed to load data');
        }
      } catch (e) {
        rethrow;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(clickWord),
      ),
      body: FutureBuilder(
        future: getWord(clickWord),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Text(clickWord),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
