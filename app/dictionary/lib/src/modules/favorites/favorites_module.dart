import 'package:flutter_modular/flutter_modular.dart';

import 'view/favorites_page.dart';
// import 'submodules/favorites_submodules_exports.dart';

class FavoritesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const FavoritesPage(),
        ),
      ];
}
