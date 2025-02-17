import 'package:untitled/NOVO/dao.dart';
import 'package:untitled/domain/comidas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPackage extends StatefulWidget {
  const RegisterPackage({super.key});

  @override
  State<RegisterPackage> createState() => _RegisterPackageState();
}

class _RegisterPackageState extends State<RegisterPackage> {
  TextEditingController urlImagemController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorAtualController = TextEditingController();
  TextEditingController valorAntigoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController avaliacaoController = TextEditingController();
  TextEditingController detalhesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: urlImagemController,
            text: 'Url da Imagem',
          ),
          buildTextFormField(
            controller: tituloController,
            text: 'Titulo',
          ),
          buildTextFormField(
            controller: descricaoController,
            text: 'Descrição',
          ),
          buildTextFormField(
            controller: valorAtualController,
            text: 'Valor Atual',
          ),
          buildTextFormField(
            controller: valorAntigoController,
            text: 'Valor Antigo',
          ),
          buildTextFormField(
            controller: cidadeController,
            text: 'cidade',
          ),
          buildTextFormField(
            controller: avaliacaoController,
            text: 'Avaliação',
          ),
          buildTextFormField(
            controller: detalhesController,
            text: 'Detalhes',
          ),

          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5757),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Comida',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFFFF5757),
      ),
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFFFF5757),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text(
        'Nova Comida',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFFFF5757),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFFF5757),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String urlImagem = urlImagemController.text;
    String titulo = tituloController.text;
    String descricao = descricaoController.text;
    double valorAtual = double.parse(valorAtualController.text);
    double valorAntigo = double.parse(valorAntigoController.text);
    String cidade = cidadeController.text;
    String avaliacao = avaliacaoController.text;
    String detalhes = detalhesController.text;

    Comidas food = Comidas(
      urlImagem: urlImagem,
      titulo: titulo,
      descricao: descricao,
      valorAtual: valorAtual,
      valorAntigo: valorAntigo,
      cidade: cidade,
      avaliacao: avaliacao,
      detalhes: detalhes,
    );

    await Dao().salvarFood(food);
    Navigator.pop(context);
  }
}