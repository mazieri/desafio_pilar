import 'package:flutter_modular/flutter_modular.dart';

import 'view/layout1_page.dart';
import '../../src_exports.dart';
// import 'submodules/layout1_submodules_exports.dart';

class Layout1Module extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const Layout1Page(), children: [
          ModuleRoute('/pageWords', module: WordsModule()),
          ModuleRoute('/pageHistory', module: HistoryModule()),
          ModuleRoute('/pageFavorites', module: FavoritesModule()),
        ]),
      ];
}
