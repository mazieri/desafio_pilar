import 'package:flutter_modular/flutter_modular.dart';

import 'view/history_page.dart';
// import 'submodules/history_submodules_exports.dart';

class HistoryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const HistoryPage(),
        ),
      ];
}
