import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/src/modules/pesquisa/domain/entities/repositorio.dart';

class DetalhesScreen extends StatefulWidget {
  final Repositorio repositorio;

  const DetalhesScreen({super.key, required this.repositorio});

  @override
  State<DetalhesScreen> createState() => _DetalhesScreenState();
}

class _DetalhesScreenState extends State<DetalhesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: widget.repositorio.id,
                child: CircleAvatar(
                  radius: 120,
                  child: ClipOval(
                    child: Image.network(
                      widget.repositorio.imagem,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              widget.repositorio.nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.repositorio.url,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
