class WordModel {
  String? word;
  List<Result>? results;
  Syllables? syllables;
  Pronunciation? pronunciation;
  String? message;

  WordModel({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
    this.message,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json["word"] ?? "",
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        syllables: json["syllables"] == null
            ? null
            : Syllables.fromJson(json["syllables"]),
        pronunciation: json["pronunciation"] == null
            ? null
            : Pronunciation.fromJson(json["pronunciation"]),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "syllables": syllables?.toJson(),
        "pronunciation": pronunciation?.toJson(),
        "message": message,
      };
}

class Pronunciation {
  String? all;

  Pronunciation({
    this.all,
  });

  factory Pronunciation.fromJson(Map<String, dynamic> json) => Pronunciation(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Result {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? hasTypes;
  List<String>? derivation;
  List<String>? examples;

  Result({
    this.definition,
    this.partOfSpeech,
    this.synonyms,
    this.typeOf,
    this.hasTypes,
    this.derivation,
    this.examples,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        definition: json["definition"] ?? "",
        partOfSpeech: json["partOfSpeech"] ?? "",
        synonyms: json["synonyms"] == null
            ? []
            : List<String>.from(json["synonyms"]!.map((x) => x)),
        typeOf: json["typeOf"] == null
            ? []
            : List<String>.from(json["typeOf"]!.map((x) => x)),
        hasTypes: json["hasTypes"] == null
            ? []
            : List<String>.from(json["hasTypes"]!.map((x) => x)),
        derivation: json["derivation"] == null
            ? []
            : List<String>.from(json["derivation"]!.map((x) => x)),
        examples: json["examples"] == null
            ? []
            : List<String>.from(json["examples"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "partOfSpeech": partOfSpeech,
        "synonyms":
            synonyms == null ? [] : List<dynamic>.from(synonyms!.map((x) => x)),
        "typeOf":
            typeOf == null ? [] : List<dynamic>.from(typeOf!.map((x) => x)),
        "hasTypes":
            hasTypes == null ? [] : List<dynamic>.from(hasTypes!.map((x) => x)),
        "derivation": derivation == null
            ? []
            : List<dynamic>.from(derivation!.map((x) => x)),
        "examples":
            examples == null ? [] : List<dynamic>.from(examples!.map((x) => x)),
      };
}

class Syllables {
  int? count;
  List<String>? list;

  Syllables({
    this.count,
    this.list,
  });

  factory Syllables.fromJson(Map<String, dynamic> json) => Syllables(
        count: json["count"] ?? 0,
        list: json["list"] == null
            ? []
            : List<String>.from(json["list"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
      };
}
