import 'dart:convert';

import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';

class RepositorioModel extends Repositorio {
  RepositorioModel({
    required super.id,
    required super.nome,
    required super.imagem,
    required super.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nome,
      'image': imagem,
      'url': url,
    };
  }

  static RepositorioModel fromMap(Map<String, dynamic> map) {
    return RepositorioModel(
      id: map['id'],
      nome: map['name'],
      imagem: map['image'],
      url: map['url'],
    );
  }

  String toJson() => jsonEncode(toMap());

  static RepositorioModel fromJson(String source) =>
      fromMap(json.decode(source));
}
