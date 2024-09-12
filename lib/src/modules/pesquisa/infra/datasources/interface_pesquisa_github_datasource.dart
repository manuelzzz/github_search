import 'package:github_search/src/modules/pesquisa/infra/models/repositorio_model.dart';

abstract class IPesquisaGithubDatasource {
  Future<List<RepositorioModel>> pesquisar(String texto);
}
