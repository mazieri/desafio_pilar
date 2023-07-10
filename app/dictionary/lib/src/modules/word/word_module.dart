import 'package:flutter_modular/flutter_modular.dart';

import 'view/word_page.dart';
import 'controllers/word_controllers_exports.dart';
// import 'submodules/word_submodules_exports.dart';

class WordModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => WordPageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/:clickWord",
          child: (_, args) => WordPage(
            clickWord: args.params["clickWord"],
            indexWord: args.data,
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
