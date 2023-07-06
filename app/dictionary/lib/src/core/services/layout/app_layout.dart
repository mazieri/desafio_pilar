import '../services_exports.dart';

final String layout =
    RemoteConfig().getValueOrDefault(key: "layout", defaultValue: "layout1");
