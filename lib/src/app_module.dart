import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/presenter/pesquisa_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/pesquisa', module: PesquisaModule());
  }
}
