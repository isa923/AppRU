import 'package:ariely/tranferencia/PixScreen.dart';
import 'package:flutter/material.dart';


class TelaPix extends StatefulWidget {
  @override
  State<TelaPix> createState() => _TelaPixState();
}


class _TelaPixState extends State<TelaPix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formas de Pagamento")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FORMAS DE PAGAMENTO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            botaoPagamento("PIX", Color(0xffFF5757), PixScreen()),
            botaoPagamento("CARTÃO DE CRÉDITO", Color(0xffFF5757), () {}),
            botaoPagamento("CARTÃO DE DÉBITO", Color(0xffFF5757), () {}),
          ],
        ),
      ),
    );
  }


  Widget botaoPagamento(String texto, Color cor, Classe) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Classe),
          );
        },
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}


