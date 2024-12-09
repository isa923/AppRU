import 'package:flutter/material.dart';
import 'package:untitled/db/salgados_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/home_pageN.dart';
import 'package:untitled/pages/deteil_page.dart';
import 'package:untitled/domain/salgado_model.dart';
import 'package:untitled/db/comidas_dao.dart';
import 'package:untitled/domain/NovasComidas.dart';

class TelaCategoria extends StatefulWidget {
  const TelaCategoria({super.key});

  @override
  State<TelaCategoria> createState() => _TelaCategoriaState();
}

class _TelaCategoriaState extends State<TelaCategoria> {
  List<Novascomidas> todasComidas = [];
  List<Novascomidas> comidasFiltradas = [];
  TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    loadData();
    _searchController.addListener(_filterComidas);
  }

  loadData() async {
    todasComidas = await ComidasDao().listarComidas();
    setState(() {
      comidasFiltradas = todasComidas;
    });
  }

  void _filterComidas() {
    String query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
      });
    } else {
      setState(() {
        isSearching = true;
        comidasFiltradas = todasComidas
            .where((comida) =>
        comida.titulo.toLowerCase().contains(query) ||
            comida.descricao.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildCategorias() {
    return ListView(
      children: [
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
                const Text(
                  'CAFÉ DA MANHÃ',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
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
                const Text(
                  'ALMOÇO',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Segunda linha de categorias
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
                const Text(
                  'JANTAR',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
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
                const Text(
                  'SALGADOS',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Terceira linha de categorias
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Adicione a lógica de navegação aqui, se necessário
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://saborecia.com.br/wp-content/uploads/2020/08/MG_4421-scaled.jpg',
                      height: 85,
                    ),
                  ),
                ),
                const Text(
                  'DOCES',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Adicione a lógica de navegação aqui, se necessário
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://blog.cybercook.com.br/wp-content/uploads/2022/07/refrigerantes-gourmet.jpg',
                      height: 85,
                    ),
                  ),
                ),
                const Text(
                  'BEBIDAS',
                  style: TextStyle(fontSize: 12, fontFamily: 'OpenSans'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComidasFiltradas() {
    return comidasFiltradas.isEmpty
        ? const Center(
      child: Text(
        'Nenhum item encontrado',
        style: TextStyle(fontSize: 16),
      ),
    )
        : ListView.builder(
      itemCount: comidasFiltradas.length,
      itemBuilder: (context, index) {
        final comida = comidasFiltradas[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.network(
              comida.urlImagem,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              comida.titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(comida.descricao),
          ),
        );
      },
    );
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'BUSQUE POR ITEM AQUI',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.search,
                  size: 40,
                ),
                fillColor: Colors.grey[400],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: isSearching ? _buildComidasFiltradas() : _buildCategorias(),
          ),
        ],
      ),
    );
  }
}