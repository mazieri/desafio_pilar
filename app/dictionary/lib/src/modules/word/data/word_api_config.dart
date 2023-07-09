import '../../../src_exports.dart';

final String wordsApiUrl =
    RemoteConfig().getValueOrDefault(key: "wordsApiUrl", defaultValue: "");

final String wordsApiHeaderHost = RemoteConfig()
    .getValueOrDefault(key: "wordsApiHeaderHost", defaultValue: "");

final String wordsApiHeaderKey = RemoteConfig()
    .getValueOrDefault(key: "wordsApiHeaderKey", defaultValue: "");
