import 'package:flutter/material.dart';
import 'package:untitled/db/shared_prefs.dart';
import 'package:untitled/pages/login.dart';
import 'package:untitled/pages/register_page.dart';
import 'package:untitled/widgets/Card_Pratos_Disponiveis.dart';
import 'package:untitled/domain/pratos_almoco.dart';
import 'package:untitled/db/Almoco_Dao.dart';

class HomePageN extends StatefulWidget {
  const HomePageN({super.key});

  @override
  State<HomePageN> createState() => _HomePageNState();
}

class _HomePageNState extends State<HomePageN> {
  late Future<List<OpcoesAlmoco>> futurePratos;

  @override
  void initState() {
    super.initState();
    futurePratos = AlmocoDao().listarAlmoco();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(context),
      body: FutureBuilder(
        future: futurePratos,
        builder: (context, snapshot) {
          print(snapshot.error.toString());

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ocorreu um erro inesperado!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(snapshot.error.toString(),
                      style: const TextStyle(color: Colors.red)),
                                  ],
              ),
            );

          }


          if (snapshot.hasData) {
            List<OpcoesAlmoco> listaAlmoco = snapshot.data!;
            return buildListView(listaAlmoco);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildListView(List<OpcoesAlmoco> listaAlmoco) {
    return ListView(
      children: [
        buildContainerOpcoes(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listaAlmoco.length,
          itemBuilder: (context, i) {
            return CardPratosDisponiveis(
              pratosDisponiveis: listaAlmoco[i],
            );
          },
        ),
      ],
    );
  }

  Widget buildContainerOpcoes() {
    return Container(
      margin: const EdgeInsets.all(16),
      color: Colors.white,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Pedidos'),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, size: 40),
              onPressed: () {},
            ),
            const Text('Buscar'),
            IconButton(
              icon: const Icon(Icons.search, size: 40),
              onPressed: () {},
            ),
            const Text('Perfil'),
            IconButton(
              icon: const Icon(Icons.person, size: 30),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFFF5757),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterPage(),
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFFFF5757),
      actions: [
        IconButton(
          onPressed: () {
            SharedPrefs().setUser(false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          icon: const Icon(Icons.logout, color: Colors.white),
        ),
      ],
      title: const Text(
        'ALMOÇO',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}