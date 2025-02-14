import 'package:untitled/db/Almoco_Dao.dart';
import 'package:untitled/domain/pratos_almoco.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPackage extends StatefulWidget {
  const RegisterPackage({super.key});

  @override
  State<RegisterPackage> createState() => _RegisterPackageState();
}

class _RegisterPackageState extends State<RegisterPackage> {
  TextEditingController urlImageController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController opcaoController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController adcController = TextEditingController();
  TextEditingController valorController = TextEditingController();


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
            controller: urlImageController,
            text: 'Url da Imagem',
          ),
          buildTextFormField(
            controller: tituloController,
            text: 'Titulo',
          ),
          buildTextFormField(
            controller: localizacaoController,
            text: 'Nome da Cidade',
          ),
          buildTextFormField(
            controller: descricaoController,
            text: 'Descrição',
          ),
          buildTextFormField(
            controller: opcaoController,
            text: 'opcao',
          ),
          buildTextFormField(
            controller: horaController,
            text: 'hora de funcionamento',
          ),
          buildTextFormField(
            controller: adcController,
            text: 'complementos',
          ),

          buildTextFormField(
            controller: valorController,
            text: 'Valor da comida',
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
              'Cadastrar Almoco',
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
        cursorColor: const Color(0xFFFFFFFF),
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
        'Novo Prato almoco',
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
    String urlImage = urlImageController.text;
    String localizacao = localizacaoController.text;
    String titulo = tituloController.text;
    String hora = horaController.text;
    String descricao = descricaoController.text;
    String  adc = adcController.text;
    String  opcao = opcaoController.text;
    double valor = double.parse(valorController.text);

    OpcoesAlmoco pratos = OpcoesAlmoco(
      urlImagem: urlImage,
      localizacao: localizacao,
      titulo: titulo,
      hora: hora,
      descricao: descricao,
      adc: adc,
      opcao: opcao,
      valor: valor,
    );

    await AlmocoDao().salvarAlmoco(pratos);
    Navigator.pop(context);
  }
}