import 'package:flutter/material.dart';
import 'package:untitled/db/databasee.dart';
import 'package:untitled/domain/comidas.dart';
import 'package:untitled/widgets/card_comidas.dart';
import 'package:untitled/NOVO/Dao.dart';
import 'package:untitled/NOVO/DB_helper.dart';
import 'package:untitled/NOVO/Register_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Comidas>> futureComidas;

  @override
  void initState() {
    super.initState();
    futureComidas = Dao().listarComidas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: FutureBuilder(
        future: futureComidas,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Ocorreu um erro inesperado!'));
          }
          if (snapshot.hasData) {
            print('TESTE');
            List<Comidas> listaComidas = snapshot.data ?? [];
            return buildListView(listaComidas);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  buildListView(listaComidas) {
    return ListView(
      children: [
        buildBarraNavegacao(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listaComidas.length,
          itemBuilder: (context, i) {
            return CardComidas(
              comidas: listaComidas[i],
            );
          },
        ),

      ],
    );
  }

  buildAppBar() {
    appBar:
    AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Text(
        'JANTAR',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    );
  }

  buildBarraNavegacao() {
   return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              onPressed: () {},
            ),
            const Text('PEDIDOS'),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {},
            ),
            const Text('BUSCA'),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: () {},
            ),
            const Text('PERFIL'),
          ],
        ),
      ],
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFFF5757),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RegisterPackage();
            },
          ),
        ).then(
          (value) async {
            setState(() {});
          },
        );
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
