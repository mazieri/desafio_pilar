import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/src_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  kIsWeb == true
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: apiKey,
            appId: appId,
            messagingSenderId: messagingSenderId,
            projectId: projectId,
          ),
        )
      : await Firebase.initializeApp();

  await RemoteConfig().start();

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = dsn
        ..release = 'dictionary0.0.1+3'
        ..environment = 'dev'
        ..tracesSampleRate = tracesSampleRate
        ..enableAutoPerformanceTracing = true
        ..autoAppStart = true
        ..enableAutoSessionTracking = true;
    },
    appRunner: () => runApp(
      DefaultAssetBundle(
        bundle: SentryAssetBundle(enableStructuredDataTracing: true),
        child: ModularApp(
          module: AppModule(),
          child: const AppChild(),
        ),
      ),
    ),
  );
}
