import 'package:ariely/pages/telaPix.dart';
import 'package:ariely/tranferencia/PixScreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagamento PIX',
      theme: ThemeData(primarySwatch: Colors.red),
      home: TelaPix(),
    );
  }
}
