import 'package:flutter/material.dart';
import 'package:untitled/db/databasee.dart';
import 'package:untitled/widgets/card_comidas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text(
          'JANTAR',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        // Use um Column para incluir o ListView e o Row
        children: [
          Expanded(
            // Envolva o ListView em um Expanded
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Database.pacotes.length,
              itemBuilder: (context, i) {
                return CardComidas(
                  comidas: Database.pacotes[i],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize
                    .min, // Para evitar que a coluna ocupe mais espaço do que necessário
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
          ),
        ],
      ),
    );
  }
}