import '../services_exports.dart';

final String dsn =
    RemoteConfig().getValueOrDefault(key: "dsn", defaultValue: "");
