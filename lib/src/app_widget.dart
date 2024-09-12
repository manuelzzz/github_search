import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/pesquisa/");

    return MaterialApp.router(
      title: 'Github Search',
      theme: ThemeData(
        useMaterial3: false,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
