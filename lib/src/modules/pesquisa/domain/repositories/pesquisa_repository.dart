import 'package:github_search/src/modules/pesquisa/infra/models/repositorio_model.dart';

abstract class IPesquisaRepository {
  Future<List<RepositorioModel>> pesquisarTexto(String text);
}
