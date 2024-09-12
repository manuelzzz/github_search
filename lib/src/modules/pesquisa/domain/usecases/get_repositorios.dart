import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';
import 'package:github_search/src/modules/pesquisa/domain/repositories/interface_pesquisa_repository.dart';
import 'package:github_search/src/modules/pesquisa/infra/repositories/pesquisa_repository.dart';

abstract class IGetRepositorios {
  final IPesquisaRepository pesquisaRepository;

  IGetRepositorios({required this.pesquisaRepository});

  Future<List<Repositorio>> pesquisar(String texto);
}

class GetRepositoriosImpl implements IGetRepositorios {
  @override
  final PesquisaRepository pesquisaRepository;

  GetRepositoriosImpl({required this.pesquisaRepository});

  @override
  Future<List<Repositorio>> pesquisar(String texto) async {
    try {
      final response = await pesquisaRepository.pesquisarTexto(texto);

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}
