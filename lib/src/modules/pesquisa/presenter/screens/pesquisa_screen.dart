import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';
import 'package:github_search/src/modules/pesquisa/presenter/pesquisa_bloc.dart';

class PesquisaScreen extends StatefulWidget {
  final pesquisaBloc = Modular.get<PesquisaBloc>();

  PesquisaScreen({
    super.key,
  });

  @override
  State<PesquisaScreen> createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {
  @override
  void dispose() {
    widget.pesquisaBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa Github'),
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Pesquisa',
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                if (value.replaceAll(" ", "").isEmpty) {
                  widget.pesquisaBloc.cleanRepos();
                  return;
                }

                widget.pesquisaBloc.getRepos(value);
              },
            ),
          ),
          StreamBuilder(
            initialData: false,
            stream: widget.pesquisaBloc.loading,
            builder: (
              BuildContext context,
              AsyncSnapshot<bool> snapshot,
            ) {
              if (snapshot.data!) {
                return const LinearProgressIndicator();
              }

              return const SizedBox();
            },
          ),
          Expanded(
            child: StreamBuilder(
              initialData: const <Repositorio>[],
              stream: widget.pesquisaBloc.repos,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Repositorio>> snapshot,
              ) {
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Hero(
                            tag: snapshot.data![index].id,
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  snapshot.data![index].imagem,
                                ),
                              ),
                            ),
                          ),
                          title: Text(snapshot.data![index].nome),
                          subtitle: Text(snapshot.data![index].url),
                          onTap: () => Modular.to.pushNamed(
                            "/pesquisa/detalhes",
                            arguments: snapshot.data![index],
                          ),
                        );
                      },
                    );
                  }
                }

                return const Center(
                  child: Text("Não foram encontrados repositórios."),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
