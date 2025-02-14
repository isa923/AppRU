import 'package:flutter/material.dart';
import 'package:untitled/db/salgados_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/home_pageN.dart';
import 'package:untitled/pages/deteil_page.dart';
import 'package:untitled/domain/salgado_model.dart';
import 'package:untitled/NOVO/dao.dart';
import 'package:untitled/domain/comidas.dart';

class Novacategoria extends StatefulWidget {
  const Novacategoria({super.key});

  @override
  State<Novacategoria> createState() => _NovacategoriaState();
}

class _NovacategoriaState extends State<Novacategoria> {
  TextEditingController searchController = TextEditingController();
  List<Comidas> comidas = [];
  List<Comidas> comidasFiltradas = [];
  Dao dao = Dao();

  @override
  void initState() {
    super.initState();
    carregarComidas();
    searchController.addListener(() {
      filtrarComidas();
    });
  }

  Future<void> carregarComidas() async {
    List<Comidas> lista = await dao.listarComidas();
    print(lista);
    setState(() {
      comidas = lista;
      comidasFiltradas = lista;
    });
  }

  void filtrarComidas() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        comidasFiltradas = List.from(comidas);
      } else {
        comidasFiltradas = comidas
            .where((comida) =>
        comida.titulo.toLowerCase().contains(query) ||
            comida.descricao.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EXPLORE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'BUSQUE POR ITEM AQUI',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search, size: 40),
                fillColor: Colors.grey[400],
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: comidasFiltradas.isEmpty
                  ? const Center(child: Text("Nenhum item encontrado."))
                  : ListView.builder(
                itemCount: comidasFiltradas.length,
                itemBuilder: (context, index) {
                  Comidas comida = comidasFiltradas[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(comida.urlImagem,
                          width: 50, height: 50),
                      title: Text(comida.titulo),
                      subtitle: Text(comida.descricao),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Text(
                            "CATEGORIAS",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DateilPage();
                                }),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://diaonline.ig.com.br/wp-content/uploads/2019/06/caf-da-manh-em-Braslia_capa-e1560882564741.jpg',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'CAFÉ DA MANHÃ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return HomePageN();
                                }),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://images2.nogueirense.com.br/wp-content/uploads/2022/10/design-sem-nome-3-1666189173.png',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'ALMOÇO',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt3dn8sVNpjaFCmEzy9Ll86zoD7qNY0BXaVQ&s',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'JANTAR',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ListaSalgados();
                                }),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://lh5.googleusercontent.com/proxy/VdQ4IkrQBR3x-DzKUrB_FzpxHjDWpKjdBNASHPPUtLlwHFs3NYR6Lfgg0y9xRIWzF40g9yalJ_6cYS392lV1S6-9xqigyn-yKZ0RZ--FStk',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'SALGADOS',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://cdn0.casamentos.com.br/vendor/8920/3_2/960/jpg/opcoes-de-doces-para-substituir-o-bem-casado-pao-de-mel-para-casamentos_13_268920-158169604631284.jpeg',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'DOCES',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://sbce.med.br/wp-content/uploads/2023/08/Captura-de-tela-2023-08-25-134110.png',
                                height: 85,
                              ),
                            ),
                          ),
                          Text(
                            'BEBIDAS',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriaItem(String titulo, String url, Widget? pagina) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (pagina != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pagina),
              );
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(url, height: 85),
          ),
        ),
        Text(
          titulo,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    );
  }
}
