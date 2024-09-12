import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/domain/usecases/get_repositorios.dart';
import 'package:github_search/src/modules/pesquisa/external/datasources/pesquisa_github_datasource_impl.dart';
import 'package:github_search/src/modules/pesquisa/infra/repositories/pesquisa_repository_impl.dart';
import 'package:github_search/src/modules/pesquisa/presenter/pesquisa_bloc.dart';
import 'package:github_search/src/modules/pesquisa/presenter/pesquisa_screen.dart';

class PesquisaModule extends Module {
  @override
  void binds(Injector i) {
    final dio = Dio();

    i.addInstance<Dio>(dio);

    i.add(PesquisaBloc.new);
    i.add<PesquisaGithubDatasourceImpl>(PesquisaGithubDatasourceImpl.new);
    i.add<PesquisaRepositoryImpl>(PesquisaRepositoryImpl.new);
    i.add<GetRepositoriosImpl>(GetRepositoriosImpl.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => PesquisaScreen(),
    );
  }
}
