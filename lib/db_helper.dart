import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "cartao.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );


    print(dbPath);
    return database;
  }


  Future<void> onCreate(Database db, int version) async {
    String sql = '''
     CREATE TABLE CARTAO (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       nome_titular VARCHAR(100),
       numero_cartao VARCHAR(100),
       validade VARCHAR(10),
       cvv VARCHAR(10),
       cpf VARCHAR(14)
     );
   ''';
    await db.execute(sql);
  }


  Future<void> addCardData(String nome, String numero, String validade, String cvv, String cpf) async {
    final db = await initDB();
    await db.insert(
      'CARTAO',
      {
        'nome_titular': nome,
        'numero_cartao': numero,
        'validade': validade,
        'cvv': cvv,
        'cpf': cpf,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
