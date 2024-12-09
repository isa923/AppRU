import 'package:flutter/material.dart';
import 'package:untitled/pages/TelaCategoria.dart';

class TelaEntrar extends StatefulWidget {
  const TelaEntrar({super.key});

  @override
  State<TelaEntrar> createState() => _TelaEntrarState();
}

class _TelaEntrarState extends State<TelaEntrar> {
  TextEditingController emailController =
  TextEditingController(); //São controladores para capturar os valores inseridos nos campos de e-mail e senha, respectivamente.
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFCBCBCA), // Colors.lightBlue,
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: ListView(
                //organizar os widgts e criei o chlidren para exibir os dados
                children: [
                  Center(
                    child: Image.asset(
                      "assets/LogoCinza.jpeg",
                      height: 200,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, //faz com que o conteudo se estique para preencher a largura disponivel
                        children: [
                          TextFormField(
                            // Cria um campo de texto que permite ao usuário inserir informações. Ele faz parte dos widgets de formulário que incluem validação, além de poder ser integrado com controladores para gerenciar os dados inseridos.
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo e-mail obrigatório.';
                              } else if (value!.contains('@')) {
                                return null;
                              } else {
                                return 'Você precisa de um e-mail válido.';
                              }
                            },
                            cursorColor: const Color(0xFF10397B),//barrinha que aparece quando vai digitar
                            decoration: buildInputDecoration(
                              'EMAIL',
                              Icons.mail_outline_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: senhaController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.length >= 1) {
                                return null;
                              } else {
                                return 'Você precisa de uma senha válida.';
                              }
                            },
                            cursorColor: const Color(0xFF10397B),
                            decoration: buildInputDecoration(
                              'SENHA',
                              Icons.lock_outline,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String senha = senhaController.text;

                                if (email == '@au' && senha == '2') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return TelaCategoria();
                                      },
                                    ),
                                  );
                                } else {
                                  print(
                                      'Email institucional e/ou Senha incorreto(s)');
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
                              'ENTRAR',
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
                  ),
                ],
              ),
            )));
  }
}

buildInputDecoration(String label, IconData iconData) {
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