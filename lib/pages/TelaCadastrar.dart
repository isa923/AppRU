import 'package:flutter/material.dart';
import 'package:untitled/pages/TelaCategoria.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  TextEditingController instituicaoController = TextEditingController();
  TextEditingController campusController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaConfirmController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBCBCA),
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/LogoCinza.jpeg", width: 200),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: instituicaoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo instituição obrigatório.';
                          } else if (!value.contains('i')) {
                            return 'Você precisa de uma instituição válida.';
                          }
                          return null;
                        },
                        cursorColor: const Color(0xFF10397B),
                        decoration: buildInputDecoration(
                          'INSTITUIÇÃO',
                          Icons.mail_outline_outlined,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: campusController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo campus obrigatório.';
                          } else if (!value.contains('a')) {
                            return 'Você precisa de um campus válido.';
                          }
                          return null;
                        },
                        cursorColor: const Color(0xFF10397B),
                        decoration: buildInputDecoration(
                          'CAMPUS',
                          Icons.mail_outline_outlined,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo e-mail obrigatório.';
                          } else if (!value.contains('@')) {
                            return 'Você precisa de um e-mail válido.';
                          }
                          return null;
                        },
                        cursorColor: const Color(0xFF10397B),
                        decoration: buildInputDecoration(
                          'EMAIL',
                          Icons.mail_outline_outlined,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: senhaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo senha obrigatório!';
                          } else if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres!';
                          }
                          return null;
                        },
                        cursorColor: const Color(0xFF10397B),
                        decoration: buildInputDecoration(
                          'SENHA',
                          Icons.lock_outline,
                        ),
                        obscureText: true, // Esconde o texto da senha
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: senhaConfirmController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo confirmar senha obrigatório!';
                          } else if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres!';
                          } else if (value != senhaController.text) {
                            return 'As senhas não coincidem!';
                          }
                          return null;
                        },
                        cursorColor: const Color(0xFF10397B),
                        decoration: buildInputDecoration(
                          'CONFIRMAR SENHA',
                          Icons.lock_outline,
                        ),
                        obscureText: true, // Esconde o texto da senha
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          // Validar os campos de e-mail e senha
                          if (formKey.currentState?.validate() ?? false) {
                            // Recuperar os dados dos TextFormFields
                            String instituicao = instituicaoController.text;
                            String campus = campusController.text;
                            String email = emailController.text;
                            String senha = senhaController.text;

                            if (instituicao == 'ifal' &&
                                campus == 'Arapiraca' &&
                                email == 'isp7@aluno.ifal.edu.br' &&
                                senha == 'belisbelis') {
                              // Navegar p/ HomePage
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TelaCategoria();
                                  },
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Email e/ou Senha incorretos'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5757),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 22,
                            horizontal: 50,
                          ),
                        ),
                        child: const Text(
                          'CADASTRAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String label, IconData iconData) {
    return InputDecoration(
      prefixIcon: Icon(iconData),
      labelText: label,
      floatingLabelStyle: const TextStyle(
        color: Color(0xFFFF5757),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFFF5757),
          width: 2,
        ),
      ),
    );
  }
}