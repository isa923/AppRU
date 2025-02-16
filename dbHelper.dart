import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "pagamentos.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE PIX (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            chave_pix TEXT NOT NULL, 
            nome_titular TEXT NOT NULL, 
            valor REAL NOT NULL, 
            data_pagamento TEXT NOT NULL
          );
        ''');

        await db.insert("PIX", {
          "chave_pix": "123e4567-e89b-12d3-a456-426614174000",
          "nome_titular": "João Silva",
          "valor": 50.00,
          "data_pagamento": "2025-02-07",
        });

        await db.insert("PIX", {
          "chave_pix": "987e6543-e21b-45c7-a567-426614175999",
          "nome_titular": "Maria Souza",
          "valor": 100.00,
          "data_pagamento": "2025-02-07",
        });
      },
    );
  }

  Future<List<Map<String, dynamic>>> getPagamentos() async {
    final Database db = await initDB();
    return db.query("PIX");
  }
}

class DBHelperScreen extends StatelessWidget {
  final DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Pagamentos")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.getPagamentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar os dados"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum pagamento encontrado"));
          }

          List<Map<String, dynamic>> pagamentos = snapshot.data!;
          return ListView.builder(
            itemCount: pagamentos.length,
            itemBuilder: (context, index) {
              var pagamento = pagamentos[index];
              return ListTile(
                title: Text(pagamento["nome_titular"]),
                subtitle: Text("Chave PIX: ${pagamento["chave_pix"]}\nData: ${pagamento["data_pagamento"]}"),
                trailing: Text("R\$ ${pagamento["valor"].toStringAsFixed(2)}"),
              );
            },
          );
        },
      ),
    );
  }
}
