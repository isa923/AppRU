import 'package:flutter/material.dart';
import 'package:untitled/domain/pratos_almoco.dart';

class Complementos extends StatefulWidget {
  final OpcoesAlmoco prato;

  const Complementos(this.prato, {super.key});
  @override
  State<Complementos> createState() => _CompleState();
}

class _CompleState extends State<Complementos> {
  OpcoesAlmoco get prato => widget.prato;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCBCBCA), //
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                "assets/aula.jpeg",
                height: 200,
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: prato.complementos.length,
                  itemBuilder: (context, i) {
                    return RadioListTile(
                        value: 'teste',
                        groupValue: 'tt',
                        title: Text(prato.complementos[i]),
                        onChanged: (value) {});
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: Text('CONCLUIR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF5757),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}