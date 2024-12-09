import 'package:untitled/db/data_base.dart';
import 'package:untitled/widgets/Card_Pratos_Disponiveis.dart';
import 'package:flutter/material.dart';

class HomePageN extends StatefulWidget {
  const HomePageN({super.key});

  @override
  State<HomePageN> createState() => _HomePageNState();
}

class _HomePageNState extends State<HomePageN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffefefe),
        title: const Text(
          'ALMOÇO',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff080808),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Database.Pratos.length,
            itemBuilder: (context, i) {
              return CardPratosDisponiveis(
                pratosDisponiveis: Database.Pratos[i],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Pedidos'),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                onPressed: () {},
              ),
              Text('Buscar'),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {},
              ),
              Text('Perfil'),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
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