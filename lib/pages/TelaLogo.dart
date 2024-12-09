import 'package:flutter/material.dart';
import 'package:untitled/pages/Tela1.dart';

class TelaLogo extends StatefulWidget {
  const TelaLogo({super.key});

  @override
  State<TelaLogo> createState() => _TelaLogoState();
}

class _TelaLogoState extends State<TelaLogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF5757),
      body: Center(
        child: InkWell(
          onTap: () {
            // Navegar para a HomePage ao tocar na imagem
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Tela1();
              }),
            );
          },
          child: Image.asset("assets/LogoRosa.jpeg", width: 300),
        ),
      ),
    );
  }
}