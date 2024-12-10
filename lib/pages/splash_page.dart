import 'package:untitled/db/shared_prefs.dart';
import 'package:untitled/pages/TelaCategoria.dart';
import 'package:untitled/pages/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 4));
    bool userStatus = await SharedPrefs().getUser();

    if (userStatus) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const TelaCategoria();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF5757),
      child: Center(
        child: Image.asset(
          "assets/LogoRosa.jpeg",
          height: 200,
        ),
      ),
    );
  }
}