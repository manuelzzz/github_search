import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';
import 'package:github_search/src/modules/pesquisa/domain/usecases/get_repositorios.dart';
import 'package:rxdart/subjects.dart';

class PesquisaBloc {
  final IGetRepositorios getRepositoriosImpl =
      Modular.get<GetRepositoriosImpl>();

  final BehaviorSubject<bool> _loading = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<Repositorio>> _repos =
      BehaviorSubject<List<Repositorio>>.seeded(<Repositorio>[]);

  Stream<bool> get loading => _loading.stream;
  Stream<List<Repositorio>> get repos => _repos.stream;

  Future<void> getRepos(String text) async {
    _loading.add(true);

    var repositorios = await getRepositoriosImpl.pesquisar(text);
    _repos.add(repositorios);

    _loading.add(false);
  }

  void cleanRepos() {
    _repos.add(<Repositorio>[]);
  }

  void dispose() {
    _loading.close();
    _repos.close();
  }
}
