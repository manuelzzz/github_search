import 'package:dio/dio.dart';
import 'package:github_search/src/modules/pesquisa/infra/datasources/interface_pesquisa_github_datasource.dart';
import 'package:github_search/src/modules/pesquisa/infra/models/repositorio_model.dart';

class PesquisaGithubDatasourceImpl implements IPesquisaGithubDatasource {
  final Dio dio;

  PesquisaGithubDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<RepositorioModel>> pesquisar(String texto) async {
    try {
      var result = await dio.get(
        "https://api.github.com/search/repositories?q=${texto.trim().replaceAll(" ", "+")}",
      );

      var resultList = result.data['items'] as List;

      var list = resultList
          .map(
            (element) => RepositorioModel(
              id: element['id'],
              nome: element['name'],
              imagem: element['owner']['avatar_url'],
              url: element['html_url'],
            ),
          )
          .toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
