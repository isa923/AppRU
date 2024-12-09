import 'package:untitled/domain/comidas.dart';
import 'package:untitled/pages/datail_page.dart';
import 'package:flutter/material.dart';

class CardComidas extends StatefulWidget {
  final Comidas comidas;

  const CardComidas({
    super.key,
    required this.comidas,
  });

  @override
  State<CardComidas> createState() => _CardComidasState();
}

class _CardComidasState extends State<CardComidas> {
  Comidas get pacote => widget.comidas;

  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200, // Define uma largura fixa para o cartão
      margin: const EdgeInsets.symmetric(
          horizontal: 8), // Espaçamento entre os cartões
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailPage(
                  comidas: pacote,
                );
              },
            ),
          );
        },
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize
                .min, // Garante que o cartão só ocupe o espaço necessário
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.network(
                  pacote.urlImagem,
                  fit:
                  BoxFit.cover, // Ajusta a imagem ao espaço sem ultrapassar
                  height:
                  220, // Ajusta a altura da imagem para um valor mais fixo
                  width: double.infinity, // Usa toda a largura disponível
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            pacote.titulo,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(pacote.descricao),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'A partir de ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'R\$ ${pacote.valorAntigo}',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'R\$ ${pacote.valorAtual}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xFFFF5757),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('COMPRAR',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF5757),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            pacote.estabelecimento,
                            overflow: TextOverflow
                                .ellipsis, // Limita o texto ao espaço disponível
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.edit_note, size: 25),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'RECHEIO',
                            style: TextStyle(color: Color(0xFFFF5757)),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(width: 6),
                        Text(pacote.avaliacao),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrement,
                        ),
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 24),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _increment,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}