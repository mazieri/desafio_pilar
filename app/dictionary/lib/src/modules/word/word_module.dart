import 'package:flutter_modular/flutter_modular.dart';

import 'view/word_page.dart';
// import 'submodules/word_submodules_exports.dart';

class WordModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const WordPage(),
        ),
      ];
}
