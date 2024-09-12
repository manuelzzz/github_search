import 'package:github_search/src/modules/pesquisa/domain/repositories/interface_pesquisa_repository.dart';
import 'package:github_search/src/modules/pesquisa/external/datasources/pesquisa_github_datasource.dart';
import 'package:github_search/src/modules/pesquisa/infra/models/repositorio_model.dart';

class PesquisaRepository implements IPesquisaRepository {
  final PesquisaGithubDatasource datasource;

  PesquisaRepository({
    required this.datasource,
  });

  @override
  Future<List<RepositorioModel>> pesquisarTexto(String texto) async {
    return await datasource.pesquisar(texto);
  }
}
