import 'package:flutter/material.dart';
import 'package:untitled/domain/salgado_model.dart';

class ListaSalgados extends StatelessWidget {
  final List<Salgado> salgados = [
    Salgado(
      urlImagem:
      'https://tse3.mm.bing.net/th?id=OIP.a8hZhpGJrC30yUGsPH6SkQHaFN&pid=Api&P=0&h=180',
      titulo: 'Coxinha',
      tipo: 'Frito',
      validade: 'Validade: 5 dias',
      descricao: 'Apenas de Frango.',
      valorAntigo: 5.00,
      valorAtual: 4.00,
    ),
    Salgado(
      urlImagem:
      'https://tse2.mm.bing.net/th?id=OIP.EYfHLoiZdlJRmslHl0wqzAHaER&pid=Api&P=0&h=180',
      titulo: 'Pastel',
      tipo: 'Frito',
      validade: 'Validade: 3 dias',
      descricao: 'Queijo,Carne e Camarão.',
      valorAntigo: 5.00,
      valorAtual: 4.00,
    ),
    Salgado(
      urlImagem:
      'https://tse1.mm.bing.net/th?id=OIP.OrkAgJES5KUBB0SmNZGLqgHaEL&pid=Api&P=0&h=180',
      titulo: 'Torta',
      tipo: 'Assada',
      validade: 'Validade: 3 dias',
      descricao: 'Frango,Sardinha e Camarão.',
      valorAntigo: 5.00,
      valorAtual: 4.00,
    ),
    Salgado(
      urlImagem:
      'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2020-12/pepperoni_pizza%C2%A9iStock.jpg',
      titulo: 'Fatia de Pizza',
      tipo: 'Assada',
      validade: 'Validade: 3 dias',
      descricao: 'Frango,Calabresa e Mista.',
      valorAntigo: 5.00,
      valorAtual: 4.00,
    ),
    Salgado(
      urlImagem:
      'https://tse4.mm.bing.net/th?id=OIP.MdPXHO78FlbUqc-fcwLm-gHaFj&pid=Api&P=0&h=180',
      titulo: 'Cachorro Quente',
      tipo: 'Cozido',
      validade: 'Validade: 3 dias',
      descricao: 'Salsicha e Carne Moída.',
      valorAntigo: 5.00,
      valorAtual: 4.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salgados:'),
      ),
      body: ListView.builder(
        itemCount: salgados.length,
        itemBuilder: (context, index) {
          final salgado = salgados[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        salgado.urlImagem,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        salgado.titulo,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffe14949),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.fastfood,
                              color: Colors.grey[700], size: 18),
                          SizedBox(width: 5),
                          Text(
                            salgado.tipo,
                            style:
                            TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.calendar_today,
                              color: Colors.grey[700], size: 18),
                          SizedBox(width: 5),
                          Text(
                            salgado.validade,
                            style:
                            TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        salgado.descricao,
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff0a0a0a)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'R\$ ${salgado.valorAtual.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              Text(
                                'De: R\$ ${salgado.valorAntigo.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[
                              800],                               shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Text(
                              'Comprar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}