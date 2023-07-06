import 'package:flutter_modular/flutter_modular.dart';

import 'view/words_page.dart';
// import 'submodules/words_submodules_exports.dart';

class WordsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const WordsPage(),
        ),
      ];
}
