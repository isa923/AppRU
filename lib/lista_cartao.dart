import 'package:flutter/material.dart';

class ListaCartoes extends StatelessWidget {
  const ListaCartoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cartões Cadastrados"),
      ),
      body: Center(
        child: Text("Aqui será a lista de cartões cadastrados."),
      ),
    );
  }
}
