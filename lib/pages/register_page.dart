import 'package:untitled/api/address_api.dart';
import 'package:untitled/db/user_dao.dart';
import 'package:untitled/domain/estado.dart';
import 'package:untitled/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmSenhaController = TextEditingController();
  TextEditingController DDDController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Entrar no ru tarsianas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFFF5757),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    "assets/RU.jpeg",
                    height: 200,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.contains("@")) {
                      return null;
                    } else {
                      return "Você precisa digitar um e-mail válido!";
                    }
                  },
                  decoration: buildInputDecoration('E-mail'),
                  cursorColor: const Color(0xFFFF5757),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: senhaController,
                  validator: (value) {
                    if (value!.length >= 2) {
                      return null;
                    } else {
                      return "Você precisa digitar uma senha válida!";
                    }
                  },
                  decoration: buildInputDecoration('Senha'),
                  cursorColor: const Color(0xFFFF5757),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: confirmSenhaController,
                  validator: (value) {
                    String senha = senhaController.text;
                    if (value!.length < 6) {
                      return "Você precisa digitar uma senha válida!";
                    } else if (value != senha) {
                      return "As senhas precisam ser iguais!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecoration('Confirmação de Senha'),
                  cursorColor: const Color(0xFFFF5757),
                ),

                const SizedBox(height: 16),
                TextFormField(
                  controller: DDDController,
                  decoration: buildInputDecoration(
                    'DDD',
                    suffixIcon: IconButton(
                      onPressed: onPressedDDDButton,
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  cursorColor: const Color(0xFF10397B),
                ),

                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5757),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> onPressedDDDButton() async {
    String ddd = DDDController.text;
    try {
      Estado estado = await EstadoApi().findEstadoByDDD(ddd);
      DDDController.text = estado.state; // Atualiza o campo com o estado correspondente
      print(estado.state);
    } catch (e) {
      showSnackBar('Ocorreu um problema inesperado!');
    }
  }

  showSnackBar(String snackBarMessage) {
    SnackBar snackBar = SnackBar(
      content: Text(snackBarMessage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  buildInputDecoration(String name, {Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFFFF5757),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFFF5757),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      User user = User(email, senha);
      UserDao().saveUser(user);
      Navigator.pop(context);
    }
  }
}