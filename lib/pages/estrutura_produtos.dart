import 'package:flutter/material.dart';
import 'package:untitled/db/db_helper.dart';
import 'package:untitled/db/produto_dao.dart';
import 'package:untitled/domain/produtos.dart';
import 'package:untitled/pages/cadastro_produto.dart';

class EstruturaProdutos extends StatefulWidget {
  const EstruturaProdutos({Key? key}) : super(key: key);

  @override
  State<EstruturaProdutos> createState() => _EstruturaProdutosState();
}
class _EstruturaProdutosState extends State<EstruturaProdutos> {
  List<Produtos> produtos = [];
  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  void _carregarProdutos() async {
    produtos = await ProdutoDao().listarPacotes();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Café da manhã',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final item = produtos[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    item.urlImagem,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.titulo,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart, size: 20),
                            onPressed: () {
                              // Lógica para adicionar ao carrinho
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Lógica para escolher o recheio
                        },
                        child: const Text(
                          'Escolher Recheio',
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$ ${item.valor.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Lógica para comprar o produto
                            },
                            child: const Text(
                              'Comprar',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () {
                            setState(() {
                              item.quantidade++;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${item.quantidade}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            setState(() {
                              if (item.quantidade > 1) item.quantidade--;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CadastroProdutoPage()),
          ).then((_) {
            setState(() {
              _carregarProdutos();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


