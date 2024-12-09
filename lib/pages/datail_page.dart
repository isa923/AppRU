import 'package:untitled/domain/comidas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final Comidas comidas;

  const DetailPage({
    super.key,
    required this.comidas,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Comidas get pacote => widget.comidas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              pacote.urlImagem,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centraliza os ícones horizontalmente
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pacote.titulo,
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  buildText(pacote.descricao),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      buildText('Detalhes:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 136),
                      buildText('A partir de ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text.rich(
                        TextSpan(
                          text: 'R\$ ${pacote.valorAntigo}',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          pacote.detalhes,
                          style: TextStyle(fontSize: 15),
                          textAlign:
                          TextAlign.justify, // Alinha o texto à justificado
                        ),
                      ),
                      const SizedBox(width: 50),
                      Text(
                        'R\$ ${pacote.valorAtual}',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5757),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("IR PARA O CARRINHO"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF5757),
                        foregroundColor: Colors.white,
                        padding:
                        EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("COMPRAR"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffCBCBCA),
                        foregroundColor: Colors.white,
                        padding:
                        EdgeInsets.symmetric(horizontal: 125, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText(String text, {TextStyle? style}) {
    return Text(
      text,
      style: style ?? GoogleFonts.montserrat(),
    );
  }
}