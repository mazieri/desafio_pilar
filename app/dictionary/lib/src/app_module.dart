import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src_exports.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseAnalytics.instance),
        Bind.singleton((i) => RemoteConfig()),
        Bind.singleton((i) => WordsJsonImport()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/",
          module: SplashModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          "/layout1",
          module: Layout1Module(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/layout2",
          module: Layout2Module(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/home",
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/words",
          module: WordsModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/word",
          module: WordModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/history",
          module: HistoryModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          "/favorites",
          module: FavoritesModule(),
          transition: TransitionType.fadeIn,
        ),
        WildcardRoute(
          child: (_, args) => const ErrorPage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
