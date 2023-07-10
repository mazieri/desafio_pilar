import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../src_exports.dart';
import '../data/word_data_exports.dart';
import '../models/word_models_exports.dart';

class WordPageController {
  final client = Modular.get<UnoHttp>();
  final cache = Modular.get<SharedPrefService>();

  Future getWord(String word) async {
    if (cache.wordsSaved.contains(word) == true) {
      var wordCache = cache.getWord(word);
      return wordCache;
    } else if (cache.wordsSaved.contains(word) == false) {
      final response = await client.get(
        "$wordsApiUrl$word",
        {
          "X-RapidAPI-Host": wordsApiHeaderHost,
          "x-rapidapi-key": wordsApiHeaderKey
        },
        {},
      );

      var value = WordModel.fromJson(response!.data);
      var encodeValue = json.encode(value);

      cache.saveWord(word, encodeValue);

      try {
        switch (response.status) {
          case 200:
            return json.decode(encodeValue);
          // return WordModel.fromJson(response.data);

          case 404:
            return json.decode(encodeValue);
          // return WordModel.fromJson(response.data);

          case >= 400 && <= 499:
            throw FormatException("4XX, $response");

          default:
            throw FormatException(
                'Failed to load data, the return is $response');
        }
      } catch (e) {
        rethrow;
      }
    } else {
      final response = await client.get(
        "$wordsApiUrl$word",
        {
          "X-RapidAPI-Host": wordsApiHeaderHost,
          "x-rapidapi-key": wordsApiHeaderKey
        },
        {},
      );

      var value = WordModel.fromJson(response!.data);
      var encodeValue = json.encode(value);

      try {
        switch (response.status) {
          case 200:
            return json.decode(encodeValue);
          // return WordModel.fromJson(response.data);

          case 404:
            return json.decode(encodeValue);
          // return WordModel.fromJson(response.data);

          case >= 400 && <= 499:
            throw FormatException("4XX, $response");

          default:
            throw FormatException(
                'Failed to load data, the return is $response');
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}
