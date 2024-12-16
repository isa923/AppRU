import 'package:flutter/material.dart';
import 'package:untitled/db/produto_dao.dart';
import 'package:untitled/domain/produtos.dart';

class CadastroProdutoPage extends StatefulWidget {
  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final _urlController = TextEditingController();
  final _tituloController = TextEditingController();
  final _valorController = TextEditingController();
  final _quantidadeController = TextEditingController();

  void _salvarProduto() async {
    final urlImagem = _urlController.text;
    final titulo = _tituloController.text;
    final valor = double.tryParse(_valorController.text) ?? 0.0;
    final quantidade = int.tryParse(_quantidadeController.text) ?? 1;

    if (urlImagem.isEmpty || titulo.isEmpty || valor <= 0 || quantidade <= 0) {
      return;
    }

    final novoProduto = Produtos(
      urlImagem: urlImagem,
      titulo: titulo,
      valor: valor,
      quantidade: quantidade,
    );

    await ProdutoDao().salvarProduto(novoProduto);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'URL da Imagem'),
            ),
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            TextField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarProduto,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
