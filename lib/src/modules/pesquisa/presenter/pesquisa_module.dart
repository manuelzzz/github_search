import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';
import 'package:github_search/src/modules/pesquisa/domain/usecases/get_repositorios.dart';
import 'package:github_search/src/modules/pesquisa/external/datasources/pesquisa_github_datasource.dart';
import 'package:github_search/src/modules/pesquisa/infra/repositories/pesquisa_repository.dart';
import 'package:github_search/src/modules/pesquisa/presenter/screens/detalhes_screen.dart';
import 'package:github_search/src/modules/pesquisa/presenter/pesquisa_bloc.dart';
import 'package:github_search/src/modules/pesquisa/presenter/screens/pesquisa_screen.dart';

class PesquisaModule extends Module {
  @override
  void binds(Injector i) {
    final dio = Dio();

    i.addInstance<Dio>(dio);

    i.add(PesquisaBloc.new);
    i.add<PesquisaGithubDatasource>(PesquisaGithubDatasource.new);
    i.add<PesquisaRepository>(PesquisaRepository.new);
    i.add<GetRepositoriosImpl>(GetRepositoriosImpl.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => PesquisaScreen(),
    );
    r.child(
      '/detalhes',
      child: (context) => DetalhesScreen(
        repositorio: r.args.data as Repositorio,
      ),
    );
  }
}
