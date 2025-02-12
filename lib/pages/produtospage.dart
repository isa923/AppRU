import 'package:flutter/material.dart';
import 'package:untitled/domain/produto.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final List<Produto> produtos = [
    Produto(
      urlImagem:
      'https://www.receiteria.com.br/wp-content/uploads/como-fazer-tapioca-00-1.jpg',
      titulo: 'TAPIOCA',
      valor: 1.99,
      quantidade: 1,
    ),
    Produto(
      urlImagem:
      'https://i1.wp.com/ncultura.pt/wp-content/uploads/2017/11/shutterstock-579999919-e1510831911710.jpg?fit=2000%2C1335&ssl=1',
      titulo: 'PÃO DE QUEIJO',
      valor: 0.50,
      quantidade: 1,
    ),
    Produto(
      urlImagem:
      'https://www.deline.com.br/assets/images/recipes/cuscuz-recheado-de-frango/mobile/thumb-video.jpg',
      titulo: 'CUSCUZ RECHEADO',
      valor: 1.99,
      quantidade: 1,
    ),
    Produto(
      urlImagem:
      'https://img.cybercook.com.br/receitas/940/bolo-do-coco-low-carb.jpeg',
      titulo: 'BOLO COMUM',
      valor: 1.99,
      quantidade: 1,
    ),
    Produto(
      urlImagem:
      'https://www.somosmamas.com.ar/wp-content/uploads/2020/03/que-son-las-frutas-1-scaled.jpg',
      titulo: 'FRUTAS',
      valor: 0.50,
      quantidade: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café da Manhã',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            )),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 0.0),
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
                    produto.urlImagem,
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
                              produto.titulo,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart, size: 20),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
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
                            'R\$ ${produto.valor.toStringAsFixed(2)}',
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
                              produto.quantidade++;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${produto.quantidade}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            setState(() {
                              if (produto.quantidade > 1) produto.quantidade--;
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          height: 60.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}