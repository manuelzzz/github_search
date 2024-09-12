import 'package:github_search/src/modules/pesquisa/domain/repositories/pesquisa_repository.dart';
import 'package:github_search/src/modules/pesquisa/external/datasources/pesquisa_github_datasource_impl.dart';
import 'package:github_search/src/modules/pesquisa/infra/models/repositorio_model.dart';

class PesquisaRepositoryImpl implements IPesquisaRepository {
  final PesquisaGithubDatasourceImpl datasource;

  PesquisaRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<List<RepositorioModel>> pesquisarTexto(String texto) async {
    return await datasource.pesquisar(texto);
  }
}
