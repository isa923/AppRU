import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/produtos.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDao {
  Future<List<Produtos>> listarPacotes() async {
    final db = await DBHelper().initDB();

    final List<Map<String, dynamic>> maps = await db.query('PRODUTO');
    //throw Exception();
    await Future.delayed(Duration(seconds: 4));

    return maps.map((json) => Produtos.fromJson(json)).toList();
  }

  Future<void> salvarProduto(Produtos produto) async {
    final db = await DBHelper().initDB();
    await db.insert('PRODUTO', produto.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

}
