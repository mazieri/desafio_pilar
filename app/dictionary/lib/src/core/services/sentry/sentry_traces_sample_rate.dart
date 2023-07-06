import '../services_exports.dart';

final double tracesSampleRate = RemoteConfig()
    .getValueOrDefault(key: "tracesSampleRate", defaultValue: 0.1);
