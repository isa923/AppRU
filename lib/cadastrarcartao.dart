  import 'package:flutter/material.dart';
  import 'package:my_app/bd/cartao_dao.dart';
  import 'package:my_app/bd/db_helper.dart';
  import 'package:my_app/domain/cartoes.dart';
  import 'package:my_app/pages/listar_cartoes.dart';

  class CadastrarCartao extends StatefulWidget {
    const CadastrarCartao({super.key});


    @override
    State<CadastrarCartao> createState() => _CadastrarCartaoState();
  }


  class _CadastrarCartaoState extends State<CadastrarCartao> {
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
                child: Text('ADICIONAR CARTÃO'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
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


      Cartoes cartao = Cartoes(
          nome_titular: nome,
          numero_cartao: numeroCartao,
          validade: validade,
          cvv: cvv,
          cpf: cpf
          );
      cartao.apresentar();


      await cartoesDAO().salvarCartao(cartao);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cartão cadastrado com sucesso!')),
      );


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListarCartoes()),
      );
    }
  }






