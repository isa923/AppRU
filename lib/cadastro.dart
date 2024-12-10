import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'lista_cartao.dart';

class CadastroScreen extends StatefulWidget {
  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nomeController = TextEditingController();

  final TextEditingController numeroCartaoController = TextEditingController();

  final TextEditingController validadeController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Cartão"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome do Titular"),
            ),
            TextField(
              controller: numeroCartaoController,
              decoration: const InputDecoration(labelText: "Número do Cartão"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: validadeController,
              decoration: const InputDecoration(labelText: "Data de Validade"),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: "CVV"),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            TextField(
              controller: cpfController,
              decoration: const InputDecoration(labelText: "CPF"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveCardData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("CONCLUIR"),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCardData() async {
    String nome = nomeController.text;
    String numeroCartao = numeroCartaoController.text;
    String validade = validadeController.text;
    String cvv = cvvController.text;
    String cpf = cpfController.text;

    DBHelper dbHelper = DBHelper();
    await dbHelper.addCardData(nome, numeroCartao, validade, cvv, cpf);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cartão cadastrado com sucesso!')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaCartoes()),
    );
  }
}
